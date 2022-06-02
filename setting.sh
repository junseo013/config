OMZ_BASE=$HOME/.oh-my-zsh # FIXME

## Vim
cp vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## tmux
cp tmux.conf $HOME/.tmux.conf

## zsh plugin
# autojump
git clone https://github.com/wting/autojump.git
cd autojump
./install.py
cd ..
rm -rf autojump

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## zsh theme
cp eastwood.zsh-theme ${OMZ_BASE}/themes

## zshrc
cp zshrc $HOME/.zshrc

. $HOME/.zshrc
