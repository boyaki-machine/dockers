#!/bin/sh

echo "Dockerでgitlabを構築するスクリプト"
echo "データは ~/var/gitlab 配下に保存されます"
echo "構築を開始します。 [yes/no] "
read answer
if [ "$answer" != "yes" ]; then
  echo "終了します"
  exit
fi

docker-compose up -d
sleep 20

echo "ブラウザで0.0.0.0:10081へアクセスして下さい。"
echo "初期ユーサはroot、パスワードは初回アクセス時に設定したものを利用して下さい。"
echo "（起動時の処理でアクセスできるようになるまで時間がかかることがあります。）"
echo "構築完了!!"

