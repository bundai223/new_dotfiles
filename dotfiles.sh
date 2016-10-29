#!/bin/bash
export PATH=/usr/local/bin:${PATH}

export CONF_BASE=~/.config
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

if [ -n $CONF_BASE ]; then
  mkdir -p $CONF_BASE
fi

# brew install

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
##
#brew tap caskroom/cask
#
#caskapp=(
# google-chrome
# android-file-transfer
# 1password
# dropbox
# skype
# steam
# cooviewer
# vlc
# iterm2
# dash
# kobito
# android-studio
# virtualbox
# vagrant
# java
#)
#brew cask install ${caskapp[@]}
#
#cellers=(
# wget
# coreutils
# findutils
# luajit
# lua
# git
# mercurial
# zsh
# z
# tmux
# the_silver_searcher
# reattach-to-user-namespace
# python
# rbenv
# go
# neovim/neovim/neovim
#)
#
#brew install ${cellers[@]}
#
#brew cleanup
#
#pip3 install --upgrade pip setuptools wheel
#pip3 install --upgrade neovim
#
#rbenv install 2.3.1
#rbenv global 2.3.1

#gem install rsense

#curl https://sh.rustup.rs -sSf | sh
#source $HOME/.cargo/env
#cargo install racer
#cargo install rustfmt
#rustup component add rust-src

NVIM_CONF=$CONF_BASE/nvim
mkdir -p $NVIM_CONF/dein
#curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer_dein.sh
#sh installer_dein.sh $NVIM_CONF/dein
#rm installer_dein.sh


