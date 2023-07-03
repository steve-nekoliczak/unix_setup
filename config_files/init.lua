--
-- Needs to be first
--

vim.g.mapleader = ' '
vim.api.nvim_set_keymap("n", "<leader>R", ":source ~/.config/nvim/init.lua<CR>", { noremap = true })

vim.cmd([[
  :call plug#begin()

  :Plug 'mileszs/ack.vim'
  :Plug 'kien/ctrlp.vim'
  :Plug 'preservim/nerdtree'
  :Plug 'vim-airline/vim-airline'
  :Plug 'tpope/vim-endwise'
  :Plug 'tpope/vim-fugitive'
  :Plug 'airblade/vim-gitgutter'
  :Plug 'tpope/vim-rails'
  :Plug 'ajh17/VimCompletesMe'
  :Plug 'kshenoy/vim-signature'
  :Plug 'morhetz/gruvbox'
  :Plug 'ngmy/vim-rubocop'
  :Plug 'christoomey/vim-tmux-navigator'
  :Plug 'tpope/vim-rhubarb'
  :Plug 'webdevel/tabulous'
  :Plug 'tmux-plugins/vim-tmux-focus-events'
  :Plug 'vim-airline/vim-airline-themes'
  :Plug 'preservim/nerdcommenter'
  :Plug 'MaxMEllon/vim-jsx-pretty'
  :Plug 'vimwiki/vimwiki'
  :Plug 'elixir-editors/vim-elixir'
  :Plug 'hashivim/vim-terraform'
  :Plug 'dense-analysis/ale'
  :Plug 'neovimhaskell/haskell-vim'

  :call plug#end()
]])

--
-- Vim plugins
--

-- git-gutter
vim.cmd('set updatetime=100')

-- git plugins' shortcuts
vim.api.nvim_set_keymap("n", "<leader>d", ":Gdiff<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Git blame<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>B", ":GBrowse<CR>", { noremap = true })

-- matchit
vim.cmd('filetype plugin on')

-- ctrlp
vim.g.ctrlp_show_hidden = 1

-- Ack
-- use silver searcher for ack
vim.g.ackprg = 'ag --nogroup --nocolor --column --hidden'
-- cnoreabbrev Ack Ack!
vim.api.nvim_set_keymap("n", "<leader>a", ":Ack!<Space>", { noremap = true })
-- searches for text selected in visual mode
vim.api.nvim_set_keymap("v", "<leader>a", 'y:Ack! <C-r>=fnameescape(@")<CR><CR>', { noremap = true })

-- rubocop
-- vim.g.vimrubocop_keymap = 0
-- nmap <Leader>r :RuboCop<CR>
-- let g:vimrubocop_config = './.rubocop.yml'

-- vim-tmux-navigator
-- let g:tmux_navigator_no_mappings = 1
vim.api.nvim_set_keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", { noremap = true })

-- NERDTree
vim.cmd('let NERDTreeShowHidden=1')

-- ALE
vim.api.nvim_set_keymap("n", "<leader>A", ":ALEToggle<CR>", { noremap = true })
vim.cmd([[
  let g:ale_linters = {'elixir': ['credo']}
]])
vim.cmd('let $MIX_ENV="test"') -- fixes ALE making mix ask for recompile on opened config.exs files

--
-- Back-end
--

vim.g.encoding = 'utf-8'

--
-- User experience
--

-- Sessions
vim.api.nvim_set_keymap("n", "<leader>s", ":mksession!<Space>", { noremap = true })
vim.cmd('set ssop-=options')

-- Spacing and indenting settings
vim.cmd([[
  set autoindent
  set tabstop=2
  set shiftwidth=2
  set nowrap
  set expandtab
]])

-- Folds
vim.cmd([[
  set foldmethod=syntax
]])

-- Visual settings
vim.cmd([[
  set nu
  set cursorline
  set ruler
  set hlsearch
  syntax enable
  set hidden
  augroup focus
    autocmd!
    autocmd FocusGained * highlight Normal ctermbg=234
    autocmd FocusGained * setlocal cursorline
    autocmd VimEnter * setlocal cursorline
    autocmd WinEnter * setlocal cursorline
    autocmd FocusLost * highlight Normal ctermbg=236
    autocmd FocusLost * setlocal nocursorline
    autocmd BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END
]])

-- Theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.airline_theme='gruvbox'
-- conceal chars on cursor line in normal mode only
vim.g.indentLine_concealcursor=''

-- Shortcut and macro settings
vim.api.nvim_set_keymap("i", ";a", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":NERDTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-i>", ":tabnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", ":tabprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>i", ":tabm +1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>u", ":tabm -1<CR>", { noremap = true })
-- MoveToPrevTab()/MoveToNextTab() are at the bottom of this file
-- Not sure how to migrate over to Lua yet

vim.api.nvim_set_keymap("n", "<C-y>", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-a>", ":vertical resize -10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-g>", ":vertical resize +10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":resize -5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", ":resize +5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>1", "1gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>2", "2gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>3", "3gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>4", "4gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>5", "5gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>6", "6gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>7", "7gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>8", "8gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>9", "9gt", { noremap = true })

--
-- Language specific settings
--

vim.cmd([[
  augroup languages
    autocmd!
    " Ruby
    autocmd FileType ruby set tabstop=2|set shiftwidth=2
    " C#
    autocmd FileType cs set tabstop=4|set shiftwidth=4
    " PHP
    autocmd FileType php set tabstop=4|set shiftwidth=4
    " Coffeescript
    autocmd FileType coffee set tabstop=2|set shiftwidth=2
    " Text files
    autocmd FileType text set tabstop=2|set shiftwidth=2
    " EJS files
    au BufNewFile,BufRead *.ejs set filetype=html|set tabstop=2|set shiftwidth=2
  augroup END
]])

--
-- vimwiki settings
-- https://vimwiki.github.io/
--

vim.cmd([[
  set nocompatible
  augroup WrapLineInMdFile
      autocmd!
      autocmd FileType markdown set wrap
  augroup END
  let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
]])
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_markdown_link_ext = 1

-- TODO move this over to lua at some point
vim.api.nvim_exec([[
" From https://vim.fandom.com/wiki/Move_current_window_between_tabs
function! MoveToPrevTab()
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

function! MoveToNextTab()
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

nnoremap <leader>h :call MoveToPrevTab()<CR>
nnoremap <leader>l :call MoveToNextTab()<CR>
]], false)
