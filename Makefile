
help:
	@echo make [nvim,update,all]

nvim:
	@ln -fs $(PWD)/.config/nvim ~/.config/nvim

update:
	@git submodule update --remote --merge
