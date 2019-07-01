##!/bin/bash

export AWS_REGION='us-east-2'
export RAILS_SERVE_STATIC_FILES=true
RAILS_ENV=production bin/rails assets:precompile


