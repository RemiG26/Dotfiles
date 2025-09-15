set fish_greeting ""

alias ls "ls -p -G"
alias la "ls -A"
alias lla "ll -a"
alias ll "eza -l -g --icons"
alias tree "eza --tree --icons"
alias vim "nvim"
alias upgrade "yay -Syu --noconfirm"

# Clipboard
abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Go
set --export PATH "$HOME/go/bin" $PATH

# Nvm
set --export NVM_DIR "$HOME/.nvm"

starship init fish | source
enable_transience
