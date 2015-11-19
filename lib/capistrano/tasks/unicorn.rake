namespace :unicorn do
  def unicorn_pid
    "#{release_path}/tmp/pids/unicorn.pid"
  end

  def run_unicorn
    execute :sudo, 'service dealerrents_unicorn start'
  end

  desc 'Start unicorn'
  task :start do
    on roles(:app) do
      run_unicorn
    end
  end

  desc 'Stop unicorn'
  task :stop do
    on roles(:app) do
      if test "[ -f #{unicorn_pid} ]"
        execute :sudo, 'service dealerrents_unicorn stop'
      end
    end
  end

  desc 'Restart unicorn'
  task :restart do
    on roles(:app) do
      if test "[ -f #{unicorn_pid} ]"
        execute :kill, "-USR2 `cat #{unicorn_pid}`"
      else
        run_unicorn
      end
    end
  end
end
