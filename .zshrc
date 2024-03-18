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

# gcloud
if [ -f '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/charleslariviere/google-cloud-sdk/completion.zsh.inc'; fi

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
