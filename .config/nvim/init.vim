if &compatible
    set nocompatible
endif

let mapleader=','

"##### cache viminfo/shadata configuration #####
let g:vimrc_cache_dirname = ".vim.cache"
let g:vimrc_cache_local_path  = getcwd()."/".g:vimrc_cache_dirname
let g:vimrc_cache_hybrid_path = expand("$HOME")."/".g:vimrc_cache_dirname."/hybrid/".substitute(getcwd(), '/', '_', 'g')
let g:vimrc_cache_global_path = expand("$HOME")."/".g:vimrc_cache_dirname."/global"
let g:deoplete#enable_at_startup = 1

"##### FUNCTIONS #####
function! IsKrling()
    return match(hostname(), 'krling') != -1
endfunction

function! VimrcIsCplane()
    return filereadable('./.config_fsmr3') && isdirectory('./C_Application')
endfunction

function! VimrcSetVimInfo(path)
    if has("nvim")
        execute 'set shada+=n'.a:path.'/.shada'
    else
        execute 'set viminfo+=n'.a:path.'/.viminfo'
    endif
endfunction

function! VimrcGetCachePath()
    return g:vimrc_cache_path
endfunction

function! VimrcEnsureDirectory(path)
    if !isdirectory(a:path)
        call mkdir(a:path, 'p')
    endif
endfunction

function! VimrcIsLocalCacheUsed()
    return g:vimrc_cache_path == g:vimrc_cache_local_path
      \ || g:vimrc_cache_path == g:vimrc_cache_hybrid_path
endfunction

function! VimrcGetFirstValidDirectory(...)
    for directory in a:000
        if isdirectory(directory)
            return directory
        endif
    endfor

    call s:throw("No valid directories ".string(a:000))
endfunction

function! VimrcIsWorkspace()
    return g:vimrc_cache_path == g:vimrc_cache_local_path
      \ || g:vimrc_cache_path == g:vimrc_cache_hybrid_path
endfunction

if !exists('s:cache_configured_flag')
    call VimrcEnsureDirectory(g:vimrc_cache_global_path)

    let g:vimrc_cache_path = VimrcGetFirstValidDirectory(
                                \ g:vimrc_cache_local_path,
                                \ g:vimrc_cache_hybrid_path,
                                \ g:vimrc_cache_global_path)

    if !VimrcIsLocalCacheUsed()
        command! -nargs=0 VimrcSetupLocalCache :
            \  try
            \|      call VimrcEnsureDirectory(g:vimrc_cache_local_path)
            \| catch
            \|      try
            \|          call VimrcEnsureDirectory(g:vimrc_cache_hybrid_path)
            \|      catch
            \|          call s:throw("[settings:cache] cannot create local path")
            \|      endtry
            \| endtry
            \| call input("local cache created, please restart vim")
            \| confirm qa
    endif

    call VimrcSetVimInfo(g:vimrc_cache_path) | let s:cache_configured_flag = 1
endif


"##### shougo/dein plugin manager #####
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein') 
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein')

    " completing words
    call dein#add('Shougo/deoplete.nvim')
    "unite
    call dein#add('Shougo/unite.vim',
                \{
                \'name':'unite',
                \'if':'IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#unite#setup#postSource()'
                \})
    call dein#add('hewes/unite-gtags',
                \{
                \'if':'IsKrling()',
                \'on_event':'VimEnter',
                \'on_ft':["cpp", "c"],
                \'hook_post_source':'call plugins#unite_gtags#setup#postSource()'
                \})
    "denite
    call dein#add('Shougo/denite.nvim',
                \{
                \'if':'!IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#denite#setup#postSource()'
                \})
    call dein#add('ozelentok/denite-gtags',
                \{
                \'if':'!IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#denite_gtags#setup#postSource()'
                \})
    "git
    call dein#add('airblade/vim-gitgutter',
                \{
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#gitgutter#setup#postSource()'
                \})
    call dein#add('tpope/vim-fugitive')
    "auto close parentheses
    call dein#add('cohama/lexima.vim')
    call dein#add('Shougo/vimfiler.vim',
                \{
                \'if':'IsKrling()',
                \'on_event':'VimEnter',
                \'hook_source':'call plugins#vimFiler#setup#before_source()',
                \'hook_post_source':'call plugins#vimFiler#setup#after_source()'
                \})
    call dein#add('aklt/plantuml-syntax')
    call dein#add('gustafj/vim-ttcn',
                \{
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#vim_ttcn#setup#postSource()'
                \})
    call dein#add('matfranczyk/vtbox.vim',
                \{
                \'name':'vtbox',
                \'if':'IsKrling()',
                \'depends':'unite',
                \'on_event':'VimEnter',
                \'hook_source':'call plugins#vtbox#setup#before_source()'
                \})
    call dein#add('matfranczyk/highlighter.vim')
    "unite - gtags fork of matfranczy
    call dein#add('https://gitlab.com/matfranczy/gtags.vim',
                \{ 'if':'VimrcIsCplane()' })
    call dein#add('https://gitlab.dynamic.nsn-net.net/mfranczy/cplane.vim.git',
                \{
                \'if':'VimrcIsCplane()',
                \'name':'cplane',
                \'depends':['unite', 'vtbox'],
                \
                \'on_event':'VimEnter',
                \'hook_source':'call plugins#cplane#setup#post_source()',
                \
                \'make':'git submodule update --recursive'
                \})

    "commentary
    call dein#add('tpope/vim-commentary')

    "enhanced cpp highlighting
    call dein#add('bfrg/vim-cpp-modern')
    call dein#add('octol/vim-cpp-enhanced-highlight',
                \{
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#cpp_enhanced_highlight#setup#postSource()'
                \})

    "enable make in vim using custom makefile
    call dein#add('tpope/vim-dispatch')

    call dein#add('Shougo/defx.nvim',
                \{
                \'if':'!IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#defx#setup#postSource()',
                \})

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    if dein#check_install()
        call dein#update()
        call dein#install()
    endif

    call dein#end()
    call dein#save_state()
endif

syntax on 

"spaces and tabs
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in tab when editing
set shiftwidth=4
set expandtab "tabs are spaces

"user interface
set number "show line numbers

filetype plugin indent on "load filetype-specific indent files
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when we need to
set showmatch "highlight matching [{()}]

"searching
set incsearch "search as characters entered
set hlsearch "highlight matches
"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"##### buffers #####

function! __vimrc_buffers_common_settings()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal shiftround
    setlocal expandtab
endfunction

function! __vimrc_vim_buffers()
    nnoremap <buffer> K :execute ':h '.expand('<cword>')<CR>
endfunction

function! __vimrc_qf_buffers()
    setlocal switchbuf=useopen
    nnoremap <buffer>q :q<CR>
endfunction

function! __vimrc_c_buffers()
    setlocal colorcolumn=120
endfunction

function! __vimrc_ttcn_buffers()
    setlocal colorcolumn=130
endfunction

function! __vimrc_cache_info()
    if VimrcIsCplane()
        return "CPlane::repository"
    endif

   if VimrcIsWorkspace()
        return "[local:cache] ".g:vimrc_cache_path
    endif
    return "[global:cache] ".g:vimrc_cache_path
endfunction

augroup VimrcBuffersSettingsAutoCmd
    autocmd!
    autocmd Filetype *      call __vimrc_buffers_common_settings()
    autocmd Filetype vim    call __vimrc_vim_buffers()
    autocmd Filetype qf     call __vimrc_qf_buffers()
    autocmd Filetype cpp,c  call __vimrc_c_buffers()
    autocmd Filetype ttcn   call __vimrc_ttcn_buffers()
augroup END

augroup VimrcGlobalSettingsAutoCmd
    autocmd!
    autocmd CursorHold * checktime
    autocmd FocusLost  * silent redraw!
    autocmd VimEnter   * echomsg __vimrc_cache_info()
augroup END

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd BufNewFile,BufRead *.log setfiletype log
autocmd BufNewFile,BufRead *.LOG setfiletype log
autocmd BufNewFile,BufRead *.out setfiletype log

highlight ColorColumn ctermbg=red

nnoremap <silent> <Right> :bn <CR>
nnoremap <silent> <Left> :bp <CR>

nnoremap <silent> <C-w>> :10winc > <CR>
nnoremap <silent> <C-w>< :10winc < <CR>


"##### Dispatch make #####
function DispatchMake(target)
    execute "Dispatch make ".a:target
endfunction

command! -nargs=1 CMake call DispatchMake('<args>')
