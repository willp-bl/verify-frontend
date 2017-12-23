FROM ruby:2.4.2

# Copying the Gemfiles separately will allow docker to detect when they haven't
# changed and skip these steps, this will allow `bundle install` to use the
# cache.
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /usr/src/app
WORKDIR /usr/src/app

EXPOSE 50300

CMD ["bundle", "exec", "puma", "-e", "development", "-p", "50300"]

