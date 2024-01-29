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

alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias lzd='lazydocker'
alias lzg='lazygit'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init - zsh)"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc'; fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
