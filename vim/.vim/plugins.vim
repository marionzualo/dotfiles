set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.vim/plugged')

Plug 'shougo/deoplete.nvim', has('nvim') ? {} : { 'do': [':UpdateRemotePlugins', ':set runtimepath+=~/.vim/plugged/deoplete.nvim/'] }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-cucumber'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/BufOnly.vim'
Plug 'danro/rename.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'jgdavey/vim-blockle'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-bundler'
Plug 'pbrisbin/vim-mkdir'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-eunuch'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/vim.ergonomic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'danchoi/ruby_bashrockets.vim'
Plug 'wincent/loupe'
Plug 'wincent/terminus'
Plug 'wincent/ferret'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-unimpaired'
Plug 'wincent/scalpel'
Plug 'ajh17/VimCompletesMe'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'

call plug#end()
