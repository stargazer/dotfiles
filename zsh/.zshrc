# zsh plugin management
source <(antibody init)
antibody bundle < ${HOME}/.zsh_plugins.txt

# Auto-completion with arrow keys
zstyle ':completion:*' menu select

# History configuration
HISTSIZE=5000               # How many lines of history to keep in memory
HISTFILE=~/.zsh_history     # Where to save history to disk
SAVEHIST=5000               # Number of history entries to save to disk
setopt    appendhistory     # Append history to the history file (no overwriting)
setopt    sharehistory      # Share history across terminals
setopt    incappendhistory  # Immediately append to the history file, not just when a term is killed

# enable color support of ls and also add handy aliases (Copied from .bashrc)
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Configure fzf (which has already been installed by the vim plugin manager)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Deal with incompatibilities when ssh-ing
export TERM=xterm-256color

alias git-network-high-level='git log --graph --all --simplify-by-decoration --pretty=format:"%C(yellow)%h%C(white)%d %C(bold black)%ar %C(reset)%n"'
alias git-network-detail='git log --graph --all --format="%D"'
alias git-network-detail-verbose='git log --graph --all --format="%D - %s"'
alias git-flow-chart="git log --graph --simplify-by-decoration --pretty=format:'%C(yellow)%h%C(white)%d %C(bold black)%ar %C(reset)%n' --all"

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Export envvar for Ansible password file
export ANSIBLE_VAULT_PASSWORD_FILE="${HOME}/.vault-smartpr"
