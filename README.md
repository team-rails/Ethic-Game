# Ethics-Game
CSCE 606 Ethics Game project


Requirements:

Ruby 2.4.1
Rails 5.2.1

Instructions to setup:

$ git clone <this_repo>
$ cd ethic_game
$ sudo su
$ chown -R ec2-user ethic_game/
$ exit
$ cd ethic_game
$ sudo yum install libxml2-devel libxslt-devel
$ nvm i v8
$ npm install -g heroku
$ sudo yum install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
$ sudo su
$ bundle install
$ exit
$ Follow these instructions for cloud9 and rails setup (skip first step, already done above): https://medium.com/@floodfx/setting-up-postgres-on-cloud9-ide-720e5b879154
$ rake db:setup
$ rake db:migrate (we don't have any yet)
$ rails server -p $PORT -b $IP (you won't get the side message but just click preview above and preview running application, than open in a browser.)
$ should see the welcome page for rails.