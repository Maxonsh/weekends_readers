namespace :deploy do
  namespace :copy do
    desc 'Copy files'
    task :copied_files do
      next unless any? :copied_files
      on release_roles :all do
        fetch(:copied_files).each do |file|
          target = release_path.join(file)
          source = shared_path.join(file)
          unless test "[ -L #{target} ]"
            execute :cp, '-f', source, target
          end
        end
      end
    end
  end

  after 'deploy:updating', 'deploy:copy:copied_files'
end
