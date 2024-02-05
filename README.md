# Bookstore Customer API

The bookstore-customer-api project is designed to manage 
a bookshop, providing an API for customer interactions.
The primary functionality of the project includes user registration
and authentication, fetching information about the current user, as well
as adding and removing books from their account.

### API endpoints
1. Signup a new customer
2. Login existing with email and password
3. Get current customer
4. Add New Book for a customer
5. Delete Customer's book

### Installation
* make sure you have installed `docker` and `docker-compose`

### Copy the following:
* `cp .env.example .env`

### Build the containers using Docker Compose:
* `docker-compose build`

### Create database and run migrations:
* `docker-compose run web bundle exec rails db:create db:migrate db:seed`

### Running application:
* `docker-compose up`

### Running tests:
* `docker-compose run web bundle exec rspec`

### Test User
user@example.com:password123