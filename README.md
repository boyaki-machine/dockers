# dockers

DockerコンテナでRedmine , Gitlab , jenkinsを構築するためのスクリプトです。
予めdocker / docker-composeコマンドが使えるようにしてください。
ローカル環境で利用することを想定してますので、セキュリティ的な考慮はされていません。
Mac（High Sierra）での動作しか確認していません。
docker/docker-composeが動けばLinux環境でも動作するかもしれません。

参考程度ですので過度な期待はしないでください...

## Redmine

redmineディレクトリに移動し、make.shを実行してください。

- Redmine 3.4.4、 MySQL 5.7で構築します。
- 下記のプラグインを入れています。
  - backlogs
  - wiki extensions
  - redmine dmsf
  - clipboard image paste
  - absolute dates
  - redmine slack
  - highlightjs
  - knowledgebase
- backlogs / dmsfがうまく動作せず、バージョンを落としたり、パッチを当てたりしています。
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

