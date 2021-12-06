au BufNewFile,BufRead *.cpp
     \ map <F9> :w <bar> :make clean && make <CR>

set number
set mouse=a

set tabstop=4
set shiftwidth=3
set expandtab

" Setting colours for vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
 autocmd VimEnter * if len(filter(values(g:plugs),'!isdirectory(v:val.dir)'))
   \| PlugInstall --sync | source $MYVIMRC
   \| endif

call plug#begin('~/.vim/plugged')
" autocomplete plugin
Plug 'vim-scripts/AutoComplPop'
"theme plugin
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
call plug#end()

"vim lightline setup
set laststatus=2
set noshowmode
if !has('gui_running')
   set t_Co=256
endif

let g:airline#extensions#tagbar#flags = 'f'
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '' },
      \ 'subseparator': { 'left': '>', 'right': '<' }
      \ }

" setting theme after installing it
colo gruvbox
set background=dark
