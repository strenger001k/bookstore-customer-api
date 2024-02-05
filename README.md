# Test Task

### Installation
* make sure you have installed `docker` and `docker-compose`

### Copy the following:
* `cp .env.example .env`

### Build the containers using Docker Compose:
* `docker-compose build`

### Create database and run migrations:
* `docker-compose run web bundle exec rails db:create db:migrate`

### Running application:
* `docker-compose up`

### Running tests:
* `docker-compose run web bundle exec rspec`