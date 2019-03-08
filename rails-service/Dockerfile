FROM ruby:2.5.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && gem install bundler 
# SqLite
RUN apt-get -y install sqlite3 libsqlite3-dev
RUN mkdir /rails-service
WORKDIR /rails-service
COPY Gemfile /rails-service/Gemfile
COPY Gemfile.lock /rails-service/Gemfile.lock
RUN bundle install
COPY . /rails-service