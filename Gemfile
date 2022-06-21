source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem 'devise'
gem 'devise-i18n'
gem 'russian'

gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'

gem "image_processing", ">= 1.2"
gem "aws-sdk-s3", require: false

gem 'active_storage_validations'
gem 'mini_magick', '>= 4.9.5'

gem "font-awesome-rails"

gem "rails", "~> 7.0.3"

gem "sprockets-rails"

gem "puma", "~> 5.0"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
end

group :development do
  gem "web-console"
  gem "sqlite3", "~> 1.4"
end

group :production do
gem "pg"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "importmap-rails", "~> 1.1"
