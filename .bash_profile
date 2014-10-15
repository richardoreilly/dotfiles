# File: .bash_profile
# -------------------
# This file is the login configuration for bash, launched upon first
# connection.


# Import .bashrc.
if [[ -f $HOME/.bashrc ]]; then
  source $HOME/.bashrc
fi


# Configure paths.
# Lowest priority first, highest priority last.
export PATH=$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
