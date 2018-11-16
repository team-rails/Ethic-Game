# Ethics-Game
CSCE 606 Ethics Game project <br/> 
 <br/> 
Live Site: https://protected-anchorage-46452.herokuapp.com/ <br/> 
 <br/> 
## Requirements:

Ruby 2.4.1 <br/>
Rails 5.2.1 <br/>

Instructions to setup: <br/> 

$ git clone <this_repo> <br/>
$ cd Ethic-game <br/>
$ sudo su <br/>
$ chown -R ec2-user ethic_game/ <br/>
$ exit <br/>
$ cd ethic_game <br/>
$ sudo yum install libxml2-devel libxslt-devel <br/>
$ nvm i v8 <br/>
$ npm install -g heroku <br/>
$ sudo yum install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs <br/>
$ sudo su <br/>
$ bundle install <br/>
$ exit <br/>
$ Follow these instructions for cloud9 and rails setup (skip first step, already done above): https://medium.com/@floodfx/setting-up-postgres-on-cloud9-ide-720e5b879154 <br/>
$ rake db:setup <br/>
$ rake db:migrate (we don't have any yet) <br/>
$ rails server -p $PORT -b $IP (you won't get the side message but just click preview above and preview running application, than open in a browser.) <br/>
$ should see the welcome page for rails. <br/>

## Database Migration

Make sure your inside the 'ethic_game' directory<br/>
<br/>
$ rake db:migrate (upgrade to latest migration) <br/>
$ rake db:rollback (downgrade recent migration) <br/>

## Start The Application

Make sure your inside the 'ethic_game' directory <br/>
<br/>
$ sudo service postgresql restart <br/>
$ rails server -p $PORT -b $IP <br/>

## Database Relation Reference

https://guides.rubyonrails.org/association_basics.html<br/>

## View Database Locally
$ psql -d ethic_game_development <br/>

Now you can run SQL queries on the db. <br/>

## Current library used for matching questions:

https://github.com/seamusabshere/fuzzy_match <br/>

## Possible Improvements

The following site has many Libraries for NLP related things: http://rubynlp.org/ <br/>

## Pushing to heroku:

(Denish pushes for now but we can make a group account and everyone will do below instructions.)<br/>
(Only one person needs to do 'heroku create', do not do it if already done.)<br/>
<br/> 
$ cd Ethics-Game<br/>
$ do not go into ethic_game directory<br/>
$ git subtree push --prefix ethic_game heroku master<br/>

# Github Contribution Rules

Make sure your inside the 'Ethics-Game' directory<br/>
<br/> 
TRY TO AVOID DIRECT MERGE/PUSH TO MASTER <br/> 
<br/> 
$ git checkout -b <feature_branch_name> <br/> 
$ git add . <br/> 
$ git commit -m "<your_message>" <br/> 
$ git status (make sure nothing is uncommited and that it shows clean) <br/> 
$ git checkout master <br/> 
$ git pull <br/> 
$ git checkout <feature_branch_name> <br/> 
$ git rebase master <br/> 
$ fix any merge conflicts if any <br/> 
$ git push -u origin <feature_branch_name> <br/> 
$ now got to github and create a merge request for your branch. <br/> 