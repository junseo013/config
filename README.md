# config

## HOW TO USE
- git clone this repo & copy these config files at your root directory, e.g. `~/.vimrc`
- `vimrc`
  - for `vimrc`, you have to git clone `Vundle.vim`
    - `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  - write this command in normal mode, `:PluginInstall`
  - Thanks to [Joonho Hwangbo](https://github.com/joonho3020), @joey3020 
- `zshrc`
  - for `zshrc`, you have to install `oh-my-zsh`
  - theme: eastwood
  - if you want to use the theme, you have to copy `eastwood.zsh-theme` to `~/.oh-my-zsh/themes/`

## Easy Setting
- Before you run the scripts, please fix the variables
  - `OMZ_BASE` in `setting.sh`: the path of oh-my-zsh base directory
  - `CONDA_BASE` in `zshrc`: the path of conda base directory
  - Then execute the commands as below
```
$ ./omz_download.sh
$ ./setting.sh
```
## NVim
```
$ cp -r nvim ~/.config
```
- Check [this](https://github.com/jskimphys/js-linux-setup/blob/main/setup.sh) to install cargo/npm and tree-sitter binary
- Thanks to [Jaisung](https://github.com/jskimphys)

## tmux
```
$ mv ~/.tmux.conf ~/.tmux.conf.bak # for backup
$ cp tmux.conf ~/.tmux.conf
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ tmux
$ tmux source ~/.tmux.conf
```
Then, press `ctrl+s` + `I`
