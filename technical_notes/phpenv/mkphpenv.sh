#!/bin/bash
set -eu

cd ~/
git clone https://github.com/CHH/phpenv.git
sh phpenv/bin/phpenv-install.sh
echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(phpenv init -)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/CHH/php-build.git $HOME/.phpenv/plugins/php-build
cd php-build/ # php-buildをインストールしたフォルダに移動する。(~/.phpenv/plugins/php-build/)
sh install.sh
brew install re2c
brew install openssl
brew install bison
brew install libxml2
brew install autoconf
brew install automake
brew install icu4c
brew install libjpeg
brew install libpng
brew install libmcrypt