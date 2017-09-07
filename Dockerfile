FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs


RUN mkdir /PhotoApp
WORKDIR /PhotoApp

ADD Gemfile /PhotoApp/Gemfile
ADD Gemfile.lock /PhotoApp/Gemfile.lock
RUN bundle install

ADD . /PhotoApp
