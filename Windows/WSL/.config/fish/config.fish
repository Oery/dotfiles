if status is-interactive
    set fish_greeting
end

clear

starship init fish | source

alias pamcan=pacman
alias ls=lsd
alias cls=clear
alias zed=zeditor

alias flutter=/home/oery/Documents/Flutter/flutter/bin/flutter

# BUN
set BUN_INSTALL "$HOME/.bun"
set PATH $BUN_INSTALL/bin:$PATH

function postexec_test --on-event fish_postexec
    if test "$argv" = cls
    else if test "$argv" = clear
    else
        echo
    end
end
