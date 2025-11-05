#!/usr/bin/env bash

# Exit on error
set -o errexit


bundle install
bin/rails javascript:install:esbuild
npm install
npm run build
bin/rails assets:precompile
bin/rails db:migrate


