"
" Vim plugins
"

" Pathogen
execute pathogen#infect()

" git-gutter
set updatetime=100

" matchit
filetype plugin on

" indentLine
let g:indentLine_char_list = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']

" silver searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" ctrlp optimization
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"
" User experience
"

" Spacing and indenting settings
set autoindent 
set tabstop=4 
set shiftwidth=4
set nowrap
set expandtab

" Visual settings
set nu
set cursorline
set ruler
set hlsearch 
syntax enable 
set hidden

" Theme
colorscheme gruvbox
set background=dark

" Shortcut and macro settings
imap ;a <Esc>
map <C-n> :NERDTreeToggle<CR>
map <C-i> :tabnext<CR>
map <C-u> :tabprevious<CR>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-y> :tabnew<CR>
map <C-a> :vertical resize -10<CR>
map <C-g> :vertical resize +10<CR>
map <C-f> :resize -10<CR>
map <C-d> :resize +10<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

"
" Language specific settings
"

" Ruby
autocmd FileType ruby set tabstop=2|set shiftwidth=2
" Coffeescript
autocmd FileType coffee set tabstop=2|set shiftwidth=2
" Text files
autocmd FileType text set tabstop=2|set shiftwidth=2




