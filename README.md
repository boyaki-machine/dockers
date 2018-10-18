# dockers

DockerコンテナでRedmine , Gitlab , jenkinsを構築するためのスクリプトです。
予めdocker / docker-composeコマンドが使えるようにしてください。
ローカル環境で利用することを想定してますので、セキュリティ的な考慮はされていません。
Mac（High Sierra）での動作しか確認していません。
docker/docker-composeが動けばLinux環境でも動作するかもしれません。

## Redmine

redmineディレクトリに移動し、make.shを実行してください。

- Redmine 3.4.4、 MySQL 5.7で構築します。
- 下記のプラグインを入れています。
  - backlogs (本家からforkされたwyplay/redmine_backlogs)
    - backlogsの本家リポジトリは余り更新されておらず、3.4.Xでいろいろ不具合が出ます。それらをforkして改修している方々がいましたので使わせてもらいます。
  - wiki extensions
  - redmine dmsf
  - clipboard image paste
  - absolute dates
  - redmine slack
  - highlightjs
  - knowledgebase
- 下記を修正する際は、docker-compose.ymlを編集してください。
  - データはベースOSの~/var/redmine配下に保存されます。
  - ポート番号は10080です。
  - DBパスワードはPASSWORDに設定されています。

## gitlab

gitlabディレクトリに移動し、make.shを実行してください。
構築が完了してから、アクセス可能になるまで少し時間がかかるようです。

- 下記を修正する際は、docker-compose.ymlを編集してください。
  - データは~/var/gitlab配下に保存されます。
  - ポート番号は10081です。

## jenkins

jenkinsディレクトリに移動し、make.shを実行してください。

- 下記を修正する際は、docker-compose.ymlを編集してください。
  - データは~/var/jenkins配下に保存されます。
  - ポート番号は18080です。


