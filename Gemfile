source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 7.1.3.4'
gem 'sass-rails'
gem 'puma'
gem 'uglifier'
gem 'coffee-rails'
gem 'bootstrap-sass'
gem 'devise'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'jquery-rails'
gem 'jbuilder'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen'
  # gem 'sqlite3'
  gem 'figaro'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'pg'