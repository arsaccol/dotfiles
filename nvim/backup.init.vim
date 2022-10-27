" Begin Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Put plugins here
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Bundle 'OmniSharp/omnisharp-vim'


call vundle#end()
filetype plugin indent on
" End Vundle stuff

" Vundle commands
" :PluginList
" :PluginInstall
" :PluginSearch
" :PluginClean

" YCM stuff
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

filetype indent plugin on
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
set completeopt=longest,menuone,preview
set previewheight=5
"let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:OmniSharp_highlight_types = 2

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    "autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    "autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

" end YCM stuff


let mapleader = "-"

set noswapfile
set autoindent
set smartindent

set splitbelow " absolutely
set splitright " blessed

set tabstop=4
set shiftwidth=4
set expandtab
set nowrap


set textwidth=0

set t_Co=256
syntax on
set rnu
set number
set showmatch
"set cursorline

set comments=s1:/*,mb:\ *,elx:\ */
set foldmethod=syntax


set backspace=indent,eol,start

if has("gui_running")
    if has("gui_win32")
        set guifont=Hack:h9:cANSI
    endif

    " Disable gvim visual clutter
    set guioptions-=T "toolbar
    set guioptions-=m "menu bar
    set guioptions-=r "scrollbar

endif

" Cesar syntax highlighting... sort of
au BufRead,BufNewFile *.ced set filetype=nasm


" TASM syntax highlighting for Intel 8086
au BufRead,BufNewFile *.ASM set filetype=tasm

" Map Ctrl+S to save
" Warning: this might freeze up some terminals!
" Configure your terminal to pass Ctrl+S to the application!
" For actual Linux or WSL: add the line "stty -ixon" to ~/.bashrc
" or corresponding startup file so the terminal doesn't freeze with Control + S.
:nmap <C-s> :w<CR>
:imap <C-s> <Esc>:w<CR>a


map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" Map jj to Enter and jk to Esc, disable default keybindings
:inoremap jj <CR>
:inoremap jk <Esc>
:inoremap <CR> <Nop>
:inoremap <Esc> <Nop>

:nnoremap <C-j> <C-w>j
:nnoremap <C-h> <C-w>h
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

:nnoremap evrc :vsp ~/.vimrc<CR>
:nnoremap srcv :source ~/.vimrc<CR>

" See date and time in status bar
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%) 

colorscheme slate


set encoding=utf-8
