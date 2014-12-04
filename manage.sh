#!/usr/bin/env bash


# File: manage.sh
# ---------------
# This simple script installs/uninstalls the dotfiles provided in the root
# directory of this source tree.
#
# Usage: ./manage.sh {install|uninstall}


readonly INSTALL_COMMAND="install"
readonly UNINSTALL_COMMAND="uninstall"

readonly OS_NAME=$(uname)
readonly OS_NAME_LINUX="Linux"

readonly VUNDLE_PARTIAL_PATH=.vim/bundle
readonly VUNDLE_COMPLETE_PATH="$VUNDLE_PARTIAL_PATH/Vundle.vim"

readonly GIT_CONFIG_STR="[user]\n\tname = %s\n\temail = %s\n[color]\n\tui = true\n"

readonly ERROR_COLOR='\033[0;31m'
readonly PROMPT_COLOR='\033[0;34m'
readonly SUCCESS_COLOR='\033[0;32m'
readonly DEFAULT_COLOR='\033[0m'


function main() {
  local argc="$1"
  local arg="$2"

  # Ensure correct usage (1 command line argument).
  if [[ "$argc" == 1 ]]; then

    # If the argument is valid, proceed by executing the appropriate function.
    case "$arg" in
      "$INSTALL_COMMAND")
        install_dotfiles
        ;;
      "$UNINSTALL_COMMAND")
        uninstall_dotfiles
        ;;
      *)
        error_message "Usage: ./manage.sh {install|uninstall}"
        exit 1
        ;;
    esac
  else
    error_message "Usage: ./manage.sh {install|uninstall}"
    exit 1
  fi
  exit 0
}

# Function: install_dotfiles
# --------------------------
# Takes care of every aspect of dotfile installation.
function install_dotfiles() {

  # Ensure git is installed.
  git --version &> /dev/null
  if [[ "$?" != 0 ]]; then

    # I only use Linux, so there is no point in bloating the simple script with
    # unneeded git installations.
    if [[ "$OS_NAME" == "$OS_NAME_LINUX" ]]; then
      echo "Installing git..."
      sudo apt-get install -y git-core > /dev/null

    # In the rare scenario a different OS is being used.
    else
      error_message "git is a required dependency."
      error_message "Please install git and then re-run this script."
      exit 1
    fi
  fi

  # Ensure the Vim plugin manager Vundle is installed.
  if [[ ! -d "$VUNDLE_COMPLETE_PATH" ]]; then
    echo "Installing Vundle..."
    git clone --quiet https://github.com/gmarik/Vundle.vim.git \
                      "$VUNDLE_COMPLETE_PATH"
  fi

  # Optionally globally configure git.
  prompt_yn "Would you like to configure git? [Y/n] "
  if [[ "$?" == 1 ]]; then

    # Prompt for git credentials.
    echo -en "${PROMPT_COLOR}git name: ${DEFAULT_COLOR}"
    read git_name
    echo -en "${PROMPT_COLOR}git email: ${DEFAULT_COLOR}"
    read git_email

    # Backup existing .gitconfig if one exists.
    if [[ -f .gitconfig ]]; then
      mv .gitconfig .gitconfig.old
    fi

    # Write data to .gitconfig.
    touch .gitconfig
    printf "$GIT_CONFIG_STR" "$git_name" "$git_email" > .gitconfig
  fi

  # Scan the directory for dotfiles, then symlink to each dotfile from root.
  echo "Symlinking dotfiles..."
  for dotfile in $(find . -maxdepth 1 -name ".[^.]*" -exec basename {} \; | \
                   grep -vE ".git(ignore)?$"); do
    local dotfile_path="$PWD/$dotfile"
    local symlink_path="$HOME/$dotfile"

    # If symlink at symlink_path remains from a previous install, delete it.
    if [[ -h "$symlink_path" ]]; then
      rm "$symlink_path"
    fi

    # Symlink.
    ln -s "$dotfile_path" "$symlink_path"
  done

  # Install Vim plugins.
  echo "Preparing to install Vim plugins..."
  sleep 3  # So the above message can be read.
  vim +PluginInstall +qall

  # Remove syntax folder from the vim-javascript plugin, as I just want the
  # indentation improvements and not the shitty syntax highlighting.
  echo "Removing .vim/bundle/vim-javascript/syntax..."
  rm -rf .vim/bundle/vim-javascript/syntax

  success_message "Everything was installed successfully."
  success_message "Please set Smyck.terminal to the default Terminal.app profile if haven't"
  success_message "already, and then restart Terminal.app."
}

# Function: uninstall_dotfiles
# ----------------------------
# Takes care of every aspect of dotfile uninstallation.
function uninstall_dotfiles() {

  # Scan the directory for dotfiles, then for each dotfile, remove the symlink
  # at root that points to it.
  echo "Removing symlinks to dotfiles..."
  for dotfile in $(find . -maxdepth 1 -name ".[^.]*" -exec basename {} \; | \
                   grep -vE ".git(ignore)?$"); do
    local symlink_path="$HOME/$dotfile"

    if [[ -h "$symlink_path" ]]; then
      rm "$symlink_path"
    fi
  done

  # Remove .gitconfig.
  if [[ -f .gitconfig ]]; then
    echo "Removing .gitconfig..."
    rm .gitconfig*
  fi

  # Remove Vundle, which contains the downloaded Vim plugins.
  echo "Uninstalling Vim plugins..."
  rm -rf "$VUNDLE_PARTIAL_PATH"

  success_message "Everything was uninstalled successfully."
}

# Function: error_message
# -----------------------
# Echoes its first argument in red.
function error_message() {
  local message="$1"

  echo -e "${ERROR_COLOR}$message${DEFAULT_COLOR}"
}

# Function: success_message
# -------------------------
# Echoes its first argument in green.
function success_message() {
  local message="$1"

  echo -e "${SUCCESS_COLOR}$message${DEFAULT_COLOR}"
}

# Function: prompt_yn
# -------------------
# Prompts for a y/n input. Returns 1 if the input is y, 0 if n.
function prompt_yn() {
  local message="$1"

  while true; do
    echo -en "${PROMPT_COLOR}$message${DEFAULT_COLOR}"
    read answer
    case "$answer" in
      [Yy]*)
        return 1
        ;;
      [Nn]*)
        return 0
        ;;
      *)
        error_message "Please enter Y/y or N/n."
        ;;
    esac
  done
}


# Execution starts at main.
main "$#" "$1"
