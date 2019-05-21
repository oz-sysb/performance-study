# 目的

パフォーマンス改善の勉強のサンプルコード
この処理を性能改善して、CSV ダウンロードが問題なくできるようにしたい

# 起動


```
# docker 起動
$ open -a Docker

# 初回のみ実行
$ docker compose build --no-cache

# 起動 (終了は docker compose down )
$ docker compose up -d

# 以下で大量データ読み込み - 4 回実行 - 2000万レコード：1回500万レコード
$ docker compose exec db /script/first-setup.sh
```


# 確認



# ログ確認

tail で流れます


```
docker compose logs -f
```


# 動作確認方法

[http://localhost:18888](http://localhost:18888)

- 修正が必要なバージョン
    - 該当ソースコード: src/csv-download.php
- 修正するポイント
       - 500 万レコードのダウンロードでメモリリミットエラーがでないようにする
       - 500 万レコードのダウンロードでタイムアウトが起きないようにする

# License

These codes are licensed under CC0.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
