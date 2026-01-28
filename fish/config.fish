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

# Docker alias
alias dc='docker compose'

# Ollama alias
alias ollama-start="sudo systemctl start ollama"
alias ollama-stop="sudo systemctl stop ollama"

# Node automatically load
if type -q nvm
    nvm use lts > /dev/null
end
