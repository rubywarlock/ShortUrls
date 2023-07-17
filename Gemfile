source 'https://rubygems.org'

ruby '3.1.4'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1.3.2'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

gem 'devise'

# gem 'faraday'

gem 'bootstrap', '~> 4.1.2'
gem 'jquery-rails'

gem 'http'
gem 'slim'
gem 'slim-rails'

gem 'psych', '< 4'

group :development, :test do
  gem 'byebug', '~> 11.1', '>= 11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '~> 0.14.1'
  gem 'pry-byebug', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :test do
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'simplecov-cobertura', '~> 2.1'
  gem 'test-prof', '~> 1.0', '>= 1.0.7'
  gem 'webmock', '~> 3.14'
  gem 'mocha'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem 'spring'
end

gem 'tzinfo-data' #, platforms: [:mingw, :mswin, :x64_mingw, :jruby]
