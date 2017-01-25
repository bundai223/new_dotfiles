#!/bin/bash
export PATH=/usr/local/bin:${PATH}

export CONF_BASE=~/.config
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src


brew_install()
{
  # brew install
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  #
  brew tap caskroom/cask

  caskapp=(
   google-chrome
   android-file-transfer
   1password
   dropbox
   skype
   steam
   cooviewer
   vlc
   iterm2
   dash
   kobito
   android-studio
   virtualbox
   vagrant
   java
   docker
   utorrent
  )
  brew cask install ${caskapp[@]}

  cellers=(
   wget
   coreutils
   findutils
   luajit
   lua
   git
   mercurial
   zsh
   z
   tmux
   the_silver_searcher
   reattach-to-user-namespace
   python
   rbenv
   go
   neovim/neovim/neovim
  )

  brew install ${cellers[@]}

  brew cleanup
}

# pip_install
pip_install()
{
  pip3 install --upgrade pip setuptools wheel
  pip3 install --upgrade neovim
  pip install --upgrade pip setuptools wheel
  pip install --upgrade neovim
}

# ruby
ruby_install()
{
  rbenv install 2.3.1
  rbenv global 2.3.1
}

gem_install()
{
  gem install rsense
  gem install neovim
}

# rust
rust_install()
{
  curl https://sh.rustup.rs -sSf | sh
  source $HOME/.cargo/env
  cargo install racer
  cargo install rustfmt
  rustup component add rust-src
}

go_install()
{
  # install go
  #OS_TYPE=linux-386
  OS_TYPE=linux-amd64
  GO_VERSION=1.7.4
  ZIPNAME=go${GO_VERSION}.${OS_TYPE}.tar.gz
  set +eu
  CHECK_VERSION=$(go version|grep ${GO_VERSION})
  set -eu
  if [ -z "${CHECK_VERSION}" ]; then
    wget http://golang.org/dl/${ZIPNAME}
    sudo tar zxvf ${ZIPNAME} -C /usr/local
    rm ${ZIPNAME}
  fi

  PATH=/usr/local/go/bin/:$PATH
  export PATH
}




if [ -n $CONF_BASE ]; then
  mkdir -p $CONF_BASE
fi

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
  brew_install
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
  go_install
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

pip_install
ruby_install
gem_install



# repos
repos=(\
 dotfiles\
 new_dotfiles\
 zshrc\
 init.vim\
 tmux.conf\
)

own_repos_dir=~/repos/github.com/bundai223/
mkdir -p $own_repos_dir
cd $own_repos_dir

github_base_url=https://github.com

for repos in ${OWN_REPOS[@]}; do
  git clone ${github_base_url}/bundai223/${repos}
done
# nvim

# Create symbolic link to dotfiles
DOTFILES_ENTITY_PATH=~/repos/github.com/bundai223/new_dotfiles
DOTFILE_NAMES_ARRAY=\
(\
 .gitconfig_global\
 .gitignore_global\
 .gitattributes_global\
 .config/git/templates\
 .ctags\
)

for dotfile in ${DOTFILE_NAMES_ARRAY[@]}; do
  ln -s ${DOTFILES_ENTITY_PATH}/${dotfile} ~/${dotfile}
done

# Make git configuration file that include common config to make local setting.
if [ ! -e ~/.gitconfig ]; then
    cp ${DOTFILES_ENTITY_PATH}/.gitconfig_local ~/.gitconfig
fi

