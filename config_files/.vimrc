"
" Needs to be first
"

let mapleader = "\<Space>"
nnoremap <leader>R :source ~/.vimrc<CR>

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
" searches for text selected in visual mode
vnoremap <Leader>A y:Ack! <C-r>=fnameescape(@")<CR><CR>

" rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
let g:vimrubocop_config = './.rubocop.yml'

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" ctags
nnoremap <leader>c :CtrlPTag<cr>

" tagbar
nmap <F8> :TagbarToggle<CR>

" tabulous
map <leader>t :call g:tabulous#renameTab()<cr>

"
" Back-end
"

set encoding=utf-8

"
" User experience
"

" Sessions
nnoremap <Leader>s :mksession!<Space>
au VimLeave * if this_session != "" | exe "mksession! ".this_session
set ssop-=options

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
au FocusGained * highlight Normal ctermbg=234 | :set cursorline
au FocusLost * highlight Normal ctermbg=238 | :set nocursorline

" Theme
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
hi TabLineSel ctermbg=LightBlue ctermfg=Black
highlight Normal ctermbg=234

" Shortcut and macro settings
imap ;a <Esc>
map <C-n> :NERDTreeToggle<CR>
map <C-i> :tabnext<CR>
map <C-u> :tabprevious<CR>
nnoremap <leader>i :tabm +1<CR>
nnoremap <leader>u :tabm -1<CR>
nnoremap <leader>h :call MoveToPrevTab()<CR>
nnoremap <leader>l :call MoveToNextTab()<CR>
" nnoremap <C-J> <C-W>j
" nnoremap <C-K> <C-W>k
" nnoremap <C-L> <C-W>l
" nnoremap <C-H> <C-W>h
nnoremap <C-y> :tabnew<CR>
map <C-a> :vertical resize -10<CR>
map <C-g> :vertical resize +10<CR>
map <C-f> :resize -5<CR>
map <C-d> :resize +5<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
map <C-W>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"
" Language specific settings
"

" Ruby
autocmd FileType ruby set tabstop=2|set shiftwidth=2
" Coffeescript
autocmd FileType coffee set tabstop=2|set shiftwidth=2
" Text files
autocmd FileType text set tabstop=2|set shiftwidth=2
" EJS files
au BufNewFile,BufRead *.ejs set filetype=html|set tabstop=2|set shiftwidth=2

"
" Functions
"

" From https://vim.fandom.com/wiki/Move_current_window_between_tabs
function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    vsp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    vsp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
