#!/usr/bin/env bash

# Exit on error
set -o errexit

bundle install
npm install
bin/rails db:migrate
bin/rails assets:precompile
bin/rails db:seed
npm run build


