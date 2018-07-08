" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'Raimondi/delimitMate'
    Plugin 'Yggdroot/indentLine'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'airblade/vim-rooter'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'godlygeek/tabular'
    Plugin 'majutsushi/tagbar'
    Plugin 'mhinz/vim-startify'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'sjl/vitality.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'xolox/vim-misc'
    Plugin 'kana/vim-arpeggio'
    Plugin 'elzr/vim-json'
    Plugin 'mbbill/undotree'
call vundle#end()

filetype plugin on

" vim
nmap <C-J> <C-W>j " select the active split
nmap <C-K> <C-W>k " select the active split
nmap <C-L> <C-W>l " select the active split
nmap <C-H> <C-W>h " select the active split

vmap // y/<C-R>"<CR><S-n>zz " search a word after selecting

set tabstop    =4        " Insert 4 spaces for a tab
set shiftwidth =4        " Insert 4 for indentation
set expandtab            " Insert space characters whenever the tab key is pressed
set number               " Show line number
set cursorline           " Hight light the current line
set cursorcolumn         " Hight light the current column
set autoindent           " Copy the indent from the previous line
set hlsearch             " hight light the search result
set t_Co       =256      " 256 color
set ambiwidth  =double   " Full width
set incsearch            " Showing matches while searching
set nobackup             " do not generate tmp file
set noswapfile           " do not generate tmp file
set autoread             " auto read update
set wildmenu
set whichwrap  =h,l      " continue move to the next line
set guifont    =Monospace\ 14
set backspace  =indent,eol,start
set encoding   =utf-8
set colorcolumn=80
" brew install vim
set clipboard  +=unnamed " Setup the system clipboard
set wildmode   =longest,list,full " tab completion for command
set laststatus =2        " show status all the time
set mouse=a              " enable mouse
set tags=./tags;/
set foldmethod=indent
set foldlevel=99
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" gvim
" set guioptions -=m " remove menu bar
" set guioptions -=T " remove toolbar
" set guioptions -=r " remove right-hand scroll bar
" set guioptions -=L " remove left-hand scroll bar

syntax enable
let g:solarized_termcolors=256
set background =dark
" set background =light
colorscheme solarized

" use the same background for git diff
:highlight clear SignColumn

" airline
let g:airline_theme='bubblegum'                 " set airline theme
let g:airline#extensions#whitespace#checks = [] " disable white space checking
let g:airline#extensions#tagbar#enabled = 0     " disable tag
let g:airline#extensions#hunks#enabled = 0      " disable git change
let g:airline_section_x = ""                    " disable file type
let g:airline_section_y = ""                    " disable fileencoding
let g:airline#extensions#virtualenv#enabled = 0 " disable virtualenv

" ctrlp
let g:ctrlp_working_path_mode = 'ra' " set local working directory
let g:ctrlp_map = '<C-P>'            " command to invoke CtrlP
let g:ctrlp_cmd = 'CtrlP'            " wake up with files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\.class\|assembly\|\.pyc'
nmap <C-M> :CtrlPMRU<CR>         " find Most-Recently-Used file

" nerd tree
nmap <C-I> :NERDTree %:p:h<CR>         " open NERDTree in current directory
nmap <C-N> :NERDTree<CR>               " open NERDTree
let g:NERDTreeIgnore =['\.pyc$']           " ignore these file in NERDTree
let g:NERDTreeMapJumpPrevSibling ='\<C-J>' " change shortcut to avoid conflict
let g:NERDTreeMapJumpNextSibling ='\<C-K>' " change shortcut to avoid conflict

" easymotion
nmap <Leader>s <Plug>(easymotion-b)
nmap <Leader>f <Plug>(easymotion-w)
nmap <Leader>e <Plug>(easymotion-k)
nmap <Leader>d <Plug>(easymotion-j)

" git gutter
nmap [s <Plug>GitGutterNextHunk
nmap [w <Plug>GitGutterPrevHunk
let g:gitgutter_max_signs = 1000

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_python_checker_args='--ignore=E501'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" indentLine
let g:indentLine_color_term = 239

" airblade rooter
let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_silent_chdir = 1

" nerd commenter
let g:NERDSpaceDelims = 1
let g:ycm_show_diagnostics_ui = 0

" vim-json
let g:vim_json_syntax_conceal = 0 " Disable conceal by default

" undotree persistent_undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
nmap <Leader>u :UndotreeToggle<CR>


" startify_custom_header
let g:startify_custom_header = [
\ '',
\ '',
\ '',
\ '',
\ '',
\ '                   $$\    $$\ $$$$$$\ $$\      $$\       $$\   $$\ $$$$$$$\',
\ '                   $$ |   $$ |\_$$  _|$$$\    $$$ |      $$$\  $$ |$$  __$$\',
\ '                   $$ |   $$ |  $$ |  $$$$\  $$$$ |      $$$$\ $$ |$$ |  $$ |',
\ '                   \$$\  $$  |  $$ |  $$\$$\$$ $$ |      $$ $$\$$ |$$$$$$$\ |',
\ '                    \$$\$$  /   $$ |  $$ \$$$  $$ |      $$ \$$$$ |$$  __$$\',
\ '                     \$$$  /    $$ |  $$ |\$  /$$ |      $$ |\$$$ |$$ |  $$ |',
\ '                      \$  /   $$$$$$\ $$ | \_/ $$ |      $$ | \$$ |$$$$$$$  |',
\ '                       \_/    \______|\__|     \__|      \__|  \__|\_______/',
\ '',
\ '',
\ '',
\ '',
\ ''
\ ]
