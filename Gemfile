source 'http://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.3'

gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'slim'
gem 'turbolinks'
gem 'state_machine', git: 'https://github.com/seuros/state_machine'
gem 'awesome_print'
gem 'pg'

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'faker'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
  gem 'shoulda-matchers', '~> 3.0'
end

group :development, :test do
  gem 'rubocop'
  gem 'brakeman', require: false
  gem 'letter_opener'
  gem 'quiet_assets'
end
