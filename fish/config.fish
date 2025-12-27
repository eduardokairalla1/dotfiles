if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship prompt
starship init fish | source

# Git alias
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log --oneline --graph --decorate'

# Node automatically load
if type -q nvm
    nvm use lts > /dev/null
end
