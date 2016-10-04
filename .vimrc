" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'gmarik/Vundle.vim'

    Plugin 'scrooloose/nerdtree'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'kien/ctrlp.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'jiangmiao/auto-pairs'
call vundle#end()

" vim
nnoremap <C-J> <C-W>j " select the active split
nnoremap <C-K> <C-W>k " select the active split
nnoremap <C-L> <C-W>l " select the active split
nnoremap <C-H> <C-W>h " select the active split

nnoremap + <C-W>+ " increase pane size vertical
nnoremap - <C-W>- " decrease pane size vertical
nnoremap < <C-W>< " increase pane size horizontal
nnoremap > <C-W>> " decrease pane size horizontal

vmap // y/<C-R>"<CR><S-n>zz " search a word after selecting

set tabstop    =4       " Insert 4 spaces for a tab
set shiftwidth =4       " Insert 4 for indentation
set expandtab           " Insert space characters whenever the tab key is pressed
set number              " Show line number
set cursorline          " Hight light the current line
set cursorcolumn        " Hight light the current column
set autoindent          " Copy the indent from the previous line
set hlsearch            " hight light the search result
set t_Co       =256     " 256 color
set ambiwidth  =double  " Full width
set incsearch           " Showing matches while searching
set nobackup            " do not generate tmp file
set noswapfile          " do not generate tmp file
set autoread            " auto read update
set wildmenu
set whichwrap  =h,l     " continue move to the next line
set guifont    =Monospace\ 14
set backspace  =indent,eol,start
set encoding   =utf-8
set colorcolumn=80
set clipboard  =unnamed " Setup the system clipboard
set wildmode   =longest,list,full " tab completion for command
set laststatus =2       "show status all the time

" gvim
" set guioptions -=m " remove menu bar
" set guioptions -=T " remove toolbar
" set guioptions -=r " remove right-hand scroll bar
" set guioptions -=L " remove left-hand scroll bar

syntax enable
let g:solarized_termcolors=256
set background =dark
colorscheme solarized

" use the same background for git diff
:highlight clear SignColumn

" airline
let g:airline#extensions#tabline#enabled = 1    " enable buffer bar
let g:airline#extensions#whitespace#checks = [] " disable white space checking
let g:airline_theme='bubblegum'                 " set airline theme

" tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" ~/.tmux.conf
" # Smart pane switching with awareness of vim splits
" # See: https://github.com/christoomey/vim-tmux-navigator
" is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?x?)(diff)?$"'
" bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
" bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
" bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
" bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
" bind -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

" ctrlp
let g:ctrlp_working_path_mode = 'ra' " set local working directory
let g:ctrlp_map = '<C-P>'            " command to invoke CtrlP
let g:ctrlp_cmd = 'CtrlPBuffer'      " wake up with files in buffer

" nerd tree
nnoremap <C-N> :NERDTree<CR> " open NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '_'
let g:NERDTreeIgnore =['^00.*', '\.tsk$', '\.o$', '\.dd$', '\.d$', '\~$', '.*\.sundev*', '.*\.linux*'] " ignore these file in NERDTree
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

" tcomment_vim
let g:tcommentMapLeader1 = ''
noremap <Leader>c :TComment<cr>
vnoremap <Leader>c :TCommentMaybeInline<cr>
