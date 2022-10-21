# README

## 環境構築
```
$ bundle install
$ bin/rails db:setup
$ yarn install
$ bin/rails s
```

## 事業をエンジニアリングしよう提案編の回答は以下に記述してください

### 選択した事業側の課題
オフラインのもくもく会は、コロナウイルスの影響でこれ以上ユーザー数の増加を見込めないが、オンラインのもくもく会であれば需要があるのではないか？

### 提案内容
オンライン開催(使用ツールはDiscordを想定)を出来るようにする

### 実装方法
- イベント投稿時にオンラインかオフラインか選ぶチェックボックスを設置
- イベントカードのサムネイルの上もしくは下に、オンライン開催かオフライン開催か表示する
- Discordの使い方を説明するページを用意
- オンライン開催かオフライン開催かで絞り込みが出来るようにする