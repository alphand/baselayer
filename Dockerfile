FROM ruby:2.3.1-onbuild

MAINTAINER darmawan.niko@gmail.com

RUN apt-get update && apt-get install -y \
  build-essential nodejs && \
  mkdir -p /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
