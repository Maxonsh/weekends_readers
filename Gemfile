source 'http://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.3'

gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'state_machine', git: 'https://github.com/seuros/state_machine'

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
end
