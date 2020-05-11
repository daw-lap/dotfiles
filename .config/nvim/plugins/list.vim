call plug#begin('$HOME/.local/share/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim'
    Plug 'ozelentok/denite-gtags'
    Plug 'Shougo/defx.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'gustafj/vim-ttcn'
    Plug 'matfranczyk/highlighter.vim'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

source $HOME/.config/nvim/plugins/deoplete.vim
source $HOME/.config/nvim/plugins/denite.vim
source $HOME/.config/nvim/plugins/defx.vim
source $HOME/.config/nvim/plugins/gitgutter.vim
source $HOME/.config/nvim/plugins/vim_cpp_enhanced_highlight.vim
source $HOME/.config/nvim/plugins/vim_ttcn.vim
