call plug#begin('$HOME/.local/share/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim'
    Plug 'ozelentok/denite-gtags'
    Plug 'Shougo/defx.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'gustafj/vim-ttcn'
    Plug 'matfranczyk/highlighter.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'yamatsum/nvim-cursorline'
"git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
"utilities
    Plug 'bronson/vim-trailing-whitespace'
"programming languages
    " Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'bfrg/vim-cpp-modern'
"fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ojroques/nvim-lspfuzzy'
    Plug 'zackhsi/fzf-tags'
"lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
call plug#end()

source $HOME/.config/nvim/plugins/deoplete.vim
source $HOME/.config/nvim/plugins/denite.vim
source $HOME/.config/nvim/plugins/defx.vim
source $HOME/.config/nvim/plugins/gitgutter.vim
source $HOME/.config/nvim/plugins/vim_ttcn.vim
source $HOME/.config/nvim/plugins/gruvbox.vim
source $HOME/.config/nvim/plugins/fzf.vim
source $HOME/.config/nvim/plugins/lsp.vim

" source $HOME/.config/nvim/plugins/vim_cpp_enhanced_highlight.vim
source $HOME/.config/nvim/plugins/vim_cpp_modern.vim
