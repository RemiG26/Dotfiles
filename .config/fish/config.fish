set fish_greeting ""

alias ls "ls -p -G"
alias la "ls -A"
alias lla "ll -a"
alias ll "exa -l -g --icons"
alias tree "exa --tree --icons"

function tv --wraps rm --description 'alias tv=cat | tidy-viewer'
    cat $argv | tidy-viewer
end

set -gx PATH $PATH $HOME/.config/composer/vendor/bin
set -gx PATH $PATH $HOME/.yarn/bin
set -gx PATH $PATH $HOME/flutter/bin
set -gx PATH $PATH $HOME/.cargo/bin

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/gavinr/Lab/interface-viewer/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/gavinr/Lab/interface-viewer/node_modules/tabtab/.completions/electron-forge.fish
