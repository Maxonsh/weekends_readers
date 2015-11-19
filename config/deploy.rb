# config valid only for current version of Capistrano
lock '3.4.0'

set :repo_url, 'git@gitlab.cifronomika.ru:cifronomika-ru/weekends_readers.git'
set :application, 'weekends_readers'

set :rvm_type, :system
set :rvm_ruby_version, `cat .ruby-version`
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :copied_files, fetch(:copied_files, []).push('config/database.yml', 'config/secrets.yml', 'config/unicorn.rb')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', '.bundle')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

after 'deploy:published', 'unicorn:restart'
