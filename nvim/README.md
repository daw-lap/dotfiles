# my_neovim - personal neovim configuration

## Requirements: 
[Neovim 0.5.x](https://github.com/neovim/neovim) , [FZF](https://github.com/junegunn/fzf)

## Installation
1. Install neovim
2. Clone this repository:
```
git clone https://github.com/dl1987/my_neovim; cd my_neovim
```
3. Install package manager [packer](https://github.com/wbthomason/packer.nvim):
```
make packer
```
4. Create python-virtualenv for python3 at least, install pynvim for created venv:
```
python3 -m venv ~/.venv/neovim_p3
source $HOME/.venv/neovim_p3/bin/activate
python -m pip install pynvim
deactivate
```
5. Install plugins using packer:
```
make packer
```
