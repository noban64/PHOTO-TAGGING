#!/usr/bin/env bash

# Exit on error
set -o errexit

bundle install
npm install
npm run build
bin/rails db:seed
bin/rails db:migrate

