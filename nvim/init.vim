source ~/.config/nvim/plugins.vim

"let mapleader = '\'
let mapleader = ","

set encoding=UTF-8
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
set cursorline

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


" TypeScript syntax highlighting
au BufRead,BufNewFile *.ts* set filetype=javascript

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

:nnoremap evrc :vsp ~/.config/nvim/init.vim<CR>
:nnoremap srcv :source ~/.config/nvim/init.vim<CR>

" Go to tab by number
:noremap <leader>1 1gt
:noremap <leader>2 2gt
:noremap <leader>3 3gt
:noremap <leader>4 4gt
:noremap <leader>5 5gt
:noremap <leader>6 6gt
:noremap <leader>7 7gt
:noremap <leader>8 8gt
:noremap <leader>9 9gt


" See date and time in status bar
" set ruler
" set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%) 

"let g:tokyonight_style = "storm"
"let g:tokyonight_style = "day"
let g:tokyonight_style = "night" " doesn't actually work with transparent background
"let g:tokyonight_transparent = 0
"let g:tokyonight_transparent = 1

let g:transparent_enabled = v:true
colorscheme tokyonight



set encoding=utf-8
set nofixendofline
