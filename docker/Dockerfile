FROM ruby:2.4-stretch

RUN curl -sL https://deb.nodesource.com/setup_10.x 
RUN apt-get update && apt-get install -y nodejs

ARG TARGET_ENVIRONMENT 
ENV RAILS_ENV $TARGET_ENVIRONMENT

RUN gem install bundler

# Copy application code
COPY . /application

WORKDIR /application

RUN echo "$TARGET_ENVIRONMENT"

RUN if [ "$TARGET_ENVIRONMENT" = "production" ] ; then bundle install --deployment --without development test ; else bundle install --deployment ; fi

ENTRYPOINT ./scripts/start.sh 
