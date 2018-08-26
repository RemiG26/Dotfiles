# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Aliases
alias cr "composer require "
alias phpd "php -S localhost:8000 -ddisplay_errors=1 -dzend-extension=xdebug.so -dxdebug.remote_enable=1 -dxdebug.remote_autostart=1 -t public"

#Disable greetings
set fish_greeting

