export ZSH="$HOME/.oh-my-zsh"

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

export CONDA_BASE=$HOME/.conda # FIXME

ZSH_THEME="eastwood"

plugins=(
  git
  zsh-autosuggestions
  autojump
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${CONDA_PATH}/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${CONDA_BASE}/etc/profile.d/conda.sh" ]; then
        . "${CONDA_BASE}/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_PATH}/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
