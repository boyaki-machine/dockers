#!/bin/sh

apt-get update
apt-get install -y vim
apt-get install -y build-essential

### backlogs install #############################################
cd /usr/src/redmine/plugins
git clone https://github.com/backlogs/redmine_backlogs.git
cd /usr/src/redmine/plugins/redmine_backlogs
# このバージョンでないとうまく動かなかった
git checkout origin/feature/redmine3
# 競合でエラーが出るのでGemfileを修正
sed -i 's/^gem "nokogiri".*/#&/g' /usr/src/redmine/plugins/redmine_backlogs/Gemfile
sed -i 's/^.*gem "capybara".*/#&/g' /usr/src/redmine/plugins/redmine_backlogs/Gemfile
# もとのquery.rbだと、新規チケット作成時にInternalエラーとなってしまうので修正したものと置き換える。
mv -f /usr/src/redmine/inst/query.rb /usr/src/redmine/app/models/query.rb
cd /usr/src/redmine
bundle install --without development test
rake redmine:plugins:migrate RAILS_ENV="production"
##################################################################

### wiki_extensions install ######################################
cd /usr/src/redmine/plugins
git clone https://github.com/haru/redmine_wiki_extensions.git
cd /usr/src/redmine
rake redmine:plugins:migrate RAILS_ENV=production
##################################################################

### dmsf install #################################################
cd /usr/src/redmine/plugins
git clone https://github.com/danmunn/redmine_dmsf.git
cd /usr/src/redmine/plugins/redmine_dmsf
# 最新版(1.6.1)をbacklogsと一緒に入れると、プロジェクト設定画面でInternal errorになるので古い版にする。
git checkout v1.6.0
cd /usr/src/redmine
bundle install --without development test
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
##################################################################

### clipboard_image_paste install ################################
cd /usr/src/redmine/plugins
git clone https://github.com/peclik/clipboard_image_paste.git
cd /usr/src/redmine
bundle install --without development test
##################################################################

### absolute_dates install #######################################
# redmine標準のN日前がわかりづらいので絶対日で表示するPluginを入れる
cd /usr/src/redmine/plugins
git clone https://github.com/suer/redmine_absolute_dates.git
cd /usr/src/redmine
bundle install --without development test
##################################################################

### slack install ################################################
cd /usr/src/redmine/plugins
git clone https://github.com/sciyoshi/redmine-slack.git redmine_slack
cd /usr/src/redmine
bundle install --without development test
##################################################################

### highlightjs install ##########################################
cd /usr/src/redmine/plugins
git clone https://github.com/dominch/redmine_highlightjs.git
cd /usr/src/redmine
bundle install --without development test
##################################################################

### knowledgebase install ########################################
cd /usr/src/redmine/plugins
git clone https://github.com/alexbevi/redmine_knowledgebase.git
cd /usr/src/redmine
bundle install --without development test
rake redmine:plugins:migrate NAME=redmine_knowledgebase RAILS_ENV=production
##################################################################

chown -R redmine. /usr/src/redmine/plugins

