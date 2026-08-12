#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle install --file="$DOTFILES/brew/Brewfile"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  [[ -d "$ZSH_CUSTOM/plugins/$plugin" ]] ||
    git clone --depth 1 "https://github.com/zsh-users/$plugin" "$ZSH_CUSTOM/plugins/$plugin"
done

mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES/tmux" "$HOME/.config/tmux"
