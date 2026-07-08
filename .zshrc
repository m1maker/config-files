export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  archlinux
  sudo
  extract
  z
  history-substring-search
  web-search
  fzf
  copybuffer
  common-aliases
  npm
  systemd
  copyfile
  copypath
  alias-finder
  safe-paste
  screen
  cp
  history
  dirhistory
  command-not-found
  encode64
  bgnotify
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

if [[ -f "$HISTFILE" ]]; then
  if [[ $(wc -l < "$HISTFILE") -ge 9500 ]]; then
    > "$HISTFILE"
  fi
fi

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b) '
setopt PROMPT_SUBST

PROMPT='%n:%~ ${vcs_info_msg_0_}%# '
