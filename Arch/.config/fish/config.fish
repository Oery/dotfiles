# function fish_prompt -d "Write out the prompt"
# This shows up as USER@HOST /home/user/ >, with the directory colored
# $USER and $hostname are set by fish, so you can just use them
# instead of using `whoami` and `hostname`
#   printf '%s@%s %s%s%s > ' $USER $hostname \
#   (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

# if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
#     cat ~/.cache/ags/user/generated/terminal/sequences.txt
# end

clear

starship init fish | source

alias pamcan=pacman
alias ls=lsd
alias cls=clear
alias hx=helix
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

zoxide init fish | source

fish_add_path /home/oery/.millennium/ext/bin
