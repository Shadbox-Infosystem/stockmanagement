# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'devise'
gem 'jbuilder'
gem 'jquery-rails'
gem 'puma'
gem 'rails', '~> 7.1.3.4'
gem 'sass-rails'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen'
  gem 'web-console'
  # gem 'sqlite3'
  gem 'figaro'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :production do
  gem 'rails_12factor'
end

gem 'pg'
gem 'roo'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
