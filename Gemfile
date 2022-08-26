source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'tzinfo-data', '~> 1.2022', '>= 1.2022.3'
gem 'pg', '~> 1.4', '>= 1.4.2'
gem 'byebug', '~> 11.1', '>= 11.1.3'  #todo: think about removing this one

gem "bootsnap", require: false

group :development, :test do
  #gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'debug', '~> 1.6', '>= 1.6.2'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
