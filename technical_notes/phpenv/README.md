## phpenvのインストール
[phpenv](https://github.com/CHH/phpenv)とは
- phpenvは異なる複数のバージョンのPHPを管理するツールです。 コマンドで任意のバージョンのPHPに切り替えることができます。
```bash
cd ~/
git clone https://github.com/CHH/phpenv.git
phpenv/bin/phpenv-install.sh
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
# --- 以下、configure: error: Cannot find libz が発生した場合
installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
# --- ここまで
phpenv install 7.2.20
phpenv global 7.2.20
phpenv rehash
```