FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y libpq-dev build-essential nodejs && gem install bundler && apt-get install imagemagick -y
RUN mkdir /app
WORKDIR /app
ADD . /app
RUN bundle install
