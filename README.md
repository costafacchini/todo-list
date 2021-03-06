## Challenge

O desafio é fazer um TO DO List

## Specifications

- [x] Poder criar várias listas de TO DO
- [x] Cada lista tem que poder ser adicionado vários itens

## Setup Ruby (only if you have not installed)

This project uses [asdf](https://asdf-vm.com/#/). \
Follow the installation [instructions](https://asdf-vm.com/#/core-manage-asdf?id=asdf)

After installation you need to follow these steps:

```bash
# Add ruby plugin on asdf
$ asdf plugin add ruby

# Install ruby plugin
$ asdf install ruby 3.0.3

# Set the default ruby for the project
$ asdf local ruby 3.0.3
```

## Setup Project

```bash
# install bundler
$ gem install bundler

# run bundle to install gems
$ bundle
```

## Database initialization

Create a new file `config/application.yml` based on the template file `config/application.sample.yml`.

Fill the default section with your database credentials.


```bash
# turn on docker
$ docker-compose up -d

# setup database
$ bin/rails db:setup

# run migrations
$ bin/rails db:migrate
```

## Run tests
```bash
# run rspec
$ bundle exec rspec
```

## Start Project
```bash
# turn on docker
$ docker-compose up -d

# run rails server
$ bin/rails server
```