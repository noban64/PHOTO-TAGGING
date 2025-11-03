#!/usr/bin/env bash

# Exit on error
set -o errexit

bundle install
npm install
npm run build 
bin/rails assets:precompile
bin/rails assets:clean
bin/rails db:migrate

bin/rails routes 
