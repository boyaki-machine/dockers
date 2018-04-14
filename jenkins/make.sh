#!/bin/sh

echo "DockerでJenkinsを構築するスクリプト"
echo "データは ~/var/jenkins 配下に保存されます"
echo "構築を開始します。 [yes/no] "
read answer
if [ "$answer" != "yes" ]; then
  echo "終了します"
  exit
fi

docker-compose up -d
sleep 10
docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

echo "ブラウザで0.0.0.0:18080へアクセスし、上記のPWを入力して下さい。"
echo "構築完了!!"
