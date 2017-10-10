# Budgeting Sinatra Portfolio Project

## Overview
A quick budgeting app to keep track of purchases you've made in the last 30 days and beyond.

## Installation

1. [Fork and clone](https://help.github.com/articles/cloning-a-repository/) this repository to your local environment.
2. Install gem dependencies using the following command in your terminal:
```
$ bundle install
```
3. Initialize and seed the database:
```
$ rake db:migrate
$ rake db:seed
```
4. [Install PostgreSQL](https://www.postgresql.org/download/). Open PostgreSQL and start the server (click the start button).
5. Start the application server:
```
$ shotgun
```
6. Navigate to http://127.0.0.1:9393/signup to get started.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/burrahey/budget-app. 

## License

This application is available as open source under the terms of the [MIT License](https://github.com/fastmode/foodme-sinatra-project/blob/master/LICENSE).
