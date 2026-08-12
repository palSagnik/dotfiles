eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin:/Applications/Ghostty.app/Contents/MacOS:$PATH"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# zsh-syntax-highlighting must stay last
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ENVARS
export KUBECONFIG=~/.kube/grofers-k8s-config

# ALIASES
alias c="clear"
alias g="git"
alias k="kubectl"
alias tmux-plugins-update='find ~/.config/tmux/plugins -mindepth 1 -maxdepth 1 -type d -exec git -C {} pull --ff-only \;'

source <(fzf --zsh)

# tmux reads a pane's cwd from the kernel, so it always reports the physical
# path and it follows the foreground process (nvim's :cd, not the shell's).
# Publish zsh's logical cwd per pane instead; tmux.conf splits prefer it.
if [[ -n $TMUX && -n $TMUX_PANE ]]; then
  publish_pane_pwd() {
    [[ $PWD == /* ]] || return
    tmux set -p -t "$TMUX_PANE" @pane_pwd "$PWD" 2>/dev/null
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook chpwd publish_pane_pwd
  publish_pane_pwd
fi
