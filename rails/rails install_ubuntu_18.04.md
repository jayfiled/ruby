# How to install Ruby on Rails in Ubuntu 18.04 LTS

Following the guide here:

https://gorails.com/setup/ubuntu/18.04

## Installing Ruby

Choose the version of Ruby you want to install:

The first step is to install some dependencies for Ruby and Rails.

To make sure we have everything necessary for Webpacker support in Rails, we're first going to start by adding the Node.js and Yarn repositories to our system before installing them.

    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    sudo apt-get update
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

Next we're going to be installing Ruby using one of three methods. Each have their own benefits, most people prefer using rbenv these days, but if you're familiar with rvm you can follow those steps as well. I've included instructions for installing from source as well, but in general, you'll want to choose either rbenv or rvm.

Choose one method. Some of these conflict with each other, so choose the one that sounds the most interesting to you, or go with my suggestion, rbenv.

    Using rbenv (Recommended)
    Using rvm
    From source

Installing with rbenv is a simple two step process. First you install rbenv, and then ruby-build:

    cd
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    exec $SHELL

    rbenv install 2.6.1
    rbenv global 2.6.1
    ruby -v

The last step is to install Bundler

    gem install bundler

rbenv users need to run rbenv rehash after installing bundler.

## Configuring Git

We'll be using Git for our version control system so we're going to set it up to match our Github account. If you don't already have a Github account, make sure to register. It will come in handy for the future.

Replace my name and email address in the following steps with the ones you used for your Github account.

    git config --global color.ui true
    git config --global user.name "YOUR NAME"
    git config --global user.email "YOUR@EMAIL.com"
    ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

The next step is to take the newly generated SSH key and add it to your Github account. You want to copy and paste the output of the following command and paste it here.

    cat ~/.ssh/id_rsa.pub

Once you've done this, you can check and see if it worked:

    ssh -T git@github.com

You should get a message like this:

Hi excid3! You've successfully authenticated, but GitHub does not provide shell access.

## Installing Rails

Choose the version of Rails you want to install:

Since Rails ships with so many dependencies these days, we're going to need to install a Javascript runtime like NodeJS. This lets you use Coffeescript and the Asset Pipeline in Rails which combines and minifies your javascript to provide a faster production environment.

To install NodeJS, we're going to add it using the official repository:

    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs

And now, without further adieu:

    gem install rails -v 5.2.2

If you're using rbenv, you'll need to run the following command to make the rails executable available:

    rbenv rehash

Now that you've installed Rails, you can run the rails -v command to make sure you have everything installed correctly:

    rails -v
    #Rails 5.2.2

If you get a different result for some reason, it means your environment may not be setup properly.

## Install postgreSQL

    sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
    wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install postgresql-common
    sudo apt-get install postgresql-9.5 libpq-dev

User and/pr apassword:

    sudo -u postgres createuser chris -s

    # If you would like to set a password for the user, you can do the following
    sudo -u postgres psql
    postgres=# \password chris

## Create Rails application

    #### If you want to use Postgres
    # Note that this will expect a postgres user with the same username
    # as your app, you may need to edit config/database.yml to match the
    # user you created earlier
    rails new myapp -d postgresql

    # Move into the application directory
    cd myapp

    # If you setup MySQL or Postgres with a username/password, modify the
    # config/database.yml file to contain the username/password that you specified

I needed to update gems and update my gemfile.lock by running this before I could create the database:

    #update Rubygems

        gem update --system

    #update bundler

        gem install bundler

    #update Gemfile.lock in your project

        bundler update --bundler


## Create the database

Need  to amend the database.yml file in config to specify a username or else you get the error:

> FATAL:  role "jayfiled" does not exist

continue from here: https://stackoverflow.com/questions/8639424/role-does-not-exist-and-unable-to-create-database-when-using-postgresql



    rake db:create

    rails server
