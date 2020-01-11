## /User/**username**/にリポジトリにあるファイル（README.md意外）を全てコピー
ファイルは全て先頭に「.」つけてRenameすること。
<br>※隠しファイルにしないように「.」をとってあるため

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

## .gitcongigのエイリアス設定
```bash
[alias]
        # いい感じのグラフでログを表示
        graph = log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'
        # 上の省略形
        gr = log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'
        st = status -s
        cm = commit
        # Untracked filesを表示せず，not stagedと，stagedだけの状態を出力する
        stt = status -uno
        # 行ごとの差分じゃなくて，単語レベルでの差分を色付きで表示する
        wdiff = diff --word-diff
        #直前のcommitを取り消す（変更は保持する）
        reset-s = reset --soft HEAD^
        #直前のcommitを取り消す（変更を保持しない）
        reset-h = reset --hard HEAD^
```
