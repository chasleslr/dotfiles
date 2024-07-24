# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    dotenv
    gcloud
    git
    poetry
    zsh-autosuggestions
  )

source $ZSH/oh-my-zsh.sh

# aliases
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias lzd='lazydocker'
alias lzg='lazygit'
alias dc='docker compose'
alias kc='kubectl'
alias gm="git machete"
alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"
alias cd="z"

# nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
# pyenv virtualenvwrapper

# gcloud
if [ -f '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc'; fi

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# postgres & openssl
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@12/lib -L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@12/include -I/opt/homebrew/opt/openssl/include"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# GPG
export GPG_TTY=$(tty)

# Created by `pipx` on 2024-06-18 14:45:52
export PATH="$PATH:/Users/charleslariviere/.local/bin"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
