
if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')

call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')

call dein#end()

filetype plugin indent on
syntax enable

" call dein#install()

" Use deoplete
let g:deoplete#enable_at_startup = 1

" racer
set hidden
let g:racer_cmd = "~/.cargo/bin/racer/target/release/racer"
" let $RUST_SRC_PATH #terminal上で設定しているはず
