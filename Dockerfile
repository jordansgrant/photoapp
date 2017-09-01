FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

#RUN groupadd -g 1000 jordan
#RUN useradd -u 1000 -g 1000 -m -d /home/jordan -s /bin/bash jordan
#USER jordan

#RUN cd /home/jordan

RUN mkdir /PhotoApp
WORKDIR /PhotoApp

ADD Gemfile /PhotoApp/Gemfile
ADD Gemfile.lock /PhotoApp/Gemfile.lock
RUN bundle install

ADD . /PhotoApp
