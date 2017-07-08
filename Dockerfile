FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential sqlite3 nodejs && gem install bundler
RUN mkdir /app
WORKDIR /app
ADD . /app
RUN bundle install
