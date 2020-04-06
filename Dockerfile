FROM lambci/lambda:build-ruby2.5

RUN gem update bundler
RUN yum install -y postgresql postgresql-devel

RUN bundle config set deployment true
RUN bundle config set without "development test"

ADD Gemfile /var/task/Gemfile
ADD Gemfile.lock /var/task/Gemfile.lock

RUN bundle install