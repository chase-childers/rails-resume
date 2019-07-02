##!/bin/bash

export AWS_REGION='us-east-2'

if [ -z  "$RAILS_ENV" ]; then RAILS_ENV="development"; fi
echo "$RAILS_ENV"
if [ "$RAILS_ENV" = "production" ]; then
	export RAILS_SERVE_STATIC_FILES=true
	bundle exec rake assets:precompile
	bundle exec rails server
else
	bin/rails server
fi

