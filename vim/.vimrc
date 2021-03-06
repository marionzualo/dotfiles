source ~/.vim/plugins.vim

syntax on

" Color theme
set background=dark

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

" Word wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t
set formatoptions+=l

" Spaces & Tabs
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2

" UI config
set number              " show line numbers
set relativenumber " the selected line has a line numbers but the other ones have a relative number to this one
filetype indent on      " load filetype-specific indent files
set autoread            " reload files when changed on disk, i.e. via `git checkout`
set cursorline " highlight the current line
set colorcolumn=120 " show line at 120 colors

" Better search
set ignorecase
set smartcase
set hlsearch
set showmatch
set incsearch

" keyboard shortcuts
let mapleader = ','
let maplocalleader = ' '
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nmap <leader><space> <Plug>(LoupeClearHighlight)

" shortcuts for clipboard copy/paste
vmap <Leader>y "*y
nmap <Leader>y "*y
nmap <Leader>p "*p
nmap <Leader>P "*P
vmap <Leader>p "*p
vmap <Leader>P "*P

" shortcut for saving file
nnoremap <Leader>w :w<CR>

" shortcut for quitting file
nnoremap <Leader>q :q<CR>

" shortcut for exiting file
nnoremap <Leader>x :xit<CR>

" indent file
map <Leader>i mmgg=G`m

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vim fugitive mappings
nnoremap gs :Gstatus<CR>

" Ag customization

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
set wildignore+=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.log
let g:gitgutter_sign_column_always = 1 " always show sign column for vim

" Syntastic settings

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["ruby"],
    \ "passive_filetypes": [] }

" Mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Do not automatically jump to the error when saving the file
" Jump feature is annoying to me as it automatically moves the cursor
let g:syntastic_auto_jump=0

" Show the error list automatically
" Allows you to easily navigate the quick fix list
let g:syntastic_auto_loc_list=1

" This is where the magic happens. Chain together different style checkers
" in order to check for both style flaws and syntax errors.
" Syntax checkers: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
let g:syntastic_ruby_checkers=['mri']
let g:syntastic_scss_checkers=['']
let g:syntastic_hbs_checkers=['']

let g:syntastic_shell = "/bin/sh"
" Full background themes
set t_ut=

" Change bockle default mapping
let g:blockle_mapping = '<Leader>bl'

" Make bufferline only print to the Airline command bar
let g:bufferline_echo = 0

" NERDTree customization
let g:NERDTreeWinSize = 60
nnoremap <leader>d :NERDTreeToggle<CR>

" buffer management

" for delete all buffers except the current one
nnoremap <Leader>o :BufOnly<CR>

" delete all buffers
nnoremap <Leader>n :BufOnly<CR>:bd<CR>

" ctags
nnoremap <Leader>gt <C-]>
nnoremap <Leader>gh :HighlightTags<CR>
let g:easytags_async = 1
let g:easytags_auto_highlight = 0

" completion

imap <Tab> <C-P>
" pull completion from tags file, buffers, and current file
set complete=.,b,u,]
set wildmode=longest,list:longest

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" ctrlp customization
let g:ctrlp_extensions = ['buffertag']
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlP<CR>

" splits management

" change vertical splits to horizontal
nnoremap <localleader>vh <C-w>t<C-w>K<CR>
" change hotizontal splits to vertical
nnoremap <localleader>hv <C-w>t<C-w>H<CR>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Vim tmux runner configuration

let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30

" Clojure syntax
autocmd VimEnter *       RainbowParenthesesToggle
autocmd Syntax   clojure RainbowParenthesesLoadRound
autocmd Syntax   clojure RainbowParenthesesLoadSquare
autocmd Syntax   clojure RainbowParenthesesLoadBraces

" enable matchit plugin
runtime macros/matchit.vim

" edit vimrc
nnoremap <Leader>v :e ~/.vimrc<CR>

" place cursor at beginning of line
nnoremap 0 ^"

" Cycle through relativenumber + number, number (only), and no numbering.
function! Cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

" <Leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
nnoremap <silent> <Leader>re :call Cycle_numbering()<CR>

let test#strategy = "vtr"

nmap <silent> <localleader>t :TestNearest<CR>
nmap <silent> <localleader>T :TestFile<CR>
nmap <silent> <localleader>l :TestLast<CR>

" fix whitespace
nnoremap <Leader>zz :FixWhitespace<CR>
"
" <LocalLeader>c -- Fix (most) syntax highlighting problems in current buffer
" (mnemonic: coloring).
nnoremap <silent> <LocalLeader>c :syntax sync fromstart<CR>

" <LocalLeader>e -- Edit file, starting in same directory as current file.
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" <localleader>p -- Show the path of the current file (mnemonic: path; useful when
" you have a lot of splits and the status line gets truncated).
nnoremap <localleader>p :echo expand('%')<CR>

" Repurpose cursor keys (accessible near homerow via "SpaceFN" layout) for one
" of my most oft-use key sequences.
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" focus on he current buffer
nnoremap <Leader>f :only<CR>

if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99
endif


if has('autocmd')
  augroup WincentAutocomplete
    autocmd!
    autocmd! User UltiSnipsEnterFirstSnippet
    autocmd User UltiSnipsEnterFirstSnippet call autocomplete#setup_mappings()
    autocmd! User UltiSnipsExitLastSnippet
    autocmd User UltiSnipsExitLastSnippet call autocomplete#teardown_mappings()
  augroup END
endif

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" Additional YouCompleteMe config.
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Disable unhelpful semantic completions.
let g:ycm_filetype_specific_completion_to_disable = {
      \   'c': 1,
      \   'gitcommit': 1,
      \   'haskell': 1,
      \   'javascript': 1,
      \   'ruby': 1
      \ }

" Same as default, but with "markdown" and "text" removed.
let g:ycm_filetype_blacklist = {
      \   'notes': 1,
      \   'unite': 1,
      \   'tagbar': 1,
      \   'pandoc': 1,
      \   'qf': 1,
      \   'vimwiki': 1,
      \   'infolog': 1,
      \   'mail': 1
      \ }"

" force quick fix window to occupy the whole horizontal width
au FileType qf wincmd J

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  " let g:deoplete#disable_auto_complete = 1
  let g:deoplete#enable_ignore_case = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endif
