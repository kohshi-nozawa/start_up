## スクリーンショットの形式・保存先・ファイル名を変更
```bash
defaults write com.apple.screencapture type jpg #拡張子をjpegに変更
defaults write com.apple.screencapture location ~/Pictures/ #保存先をPicturesに変更
defaults write com.apple.screencapture name "ScreenShot" #ファイル名の先頭文字をScreenShotに変更
killall SystemUIServer #macOS Sierra以降は不要
```

## Homebrew install
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
詳しくは[こちら](https://brew.sh/index_ja "こちら")

## Tab保管
```bash
brew install bash-completion
```
タブ補完を有効にするには .bash_profile に以下のようなコードを追加する必要がある。これでターミナル起動時に bash-completion を読み込み、タブ補完が有効になる。
<br>**このリポジトリのbash_profileにはすでに記載済み**
```bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```
