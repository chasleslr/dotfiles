export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    aws
    dotenv
    gcloud
    git
    zsh-autosuggestions
  )

source $ZSH/oh-my-zsh.sh

# aliases
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias lzd='lazydocker'
alias lzg='lazygit'

# nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init - zsh)"

# gcloud
if [ -f '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc'; fi

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
