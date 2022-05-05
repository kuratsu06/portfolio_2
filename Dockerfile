FROM ruby:2.7.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       default-mysql-client \
                       yarn

#RUN APP_ROOT /portfolio_2
WORKDIR /portfolio_2

COPY Gemfile /portfolio_2/Gemfile
COPY Gemfile.lock /portfolio_2/Gemfile.lock

RUN bundle install
ADD . /portfolio_2
