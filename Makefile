
help:
	@echo make [nvim,update,all]

wezterm:
	@ln -fs $(PWD)/.wezterm.lua ~/.wezterm.lua

nvim:
	@ln -fs $(PWD)/.config/nvim ~/.config/nvim

update:
	@git submodule update --remote --merge
