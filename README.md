# README

Make sure you are at the project main folder at the terminal

COMMANDS FOR THE ENTIRE TEAM

```bash
git pull origin master
bundle install
yarn install
touch .env
touch config/master.key
```
Now you must go to the TEAM SLACK CHANNEL, and follow the instructions to get the master key

After you have the master key, do the following commands:

```bash
rails generate simple_form:install --bootstrap
rails db:drop db:create db:migrate
```

That's it, you are ready to go!
