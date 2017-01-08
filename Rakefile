TASKS = [1, 2, 3, 4, 5]

desc 'Starts a proecss to run tests on a task when its solution is modified'
task :watch do
  system 'bundle exec observr observr.rb'
end

task :check_all do
  TASKS.each do |task_id|
    Rake::Task['check'].reenable
    Rake::Task['check'].invoke(task_id)
  end
end

task :check, :task_id do |_, arguments|
  task_id = arguments[:task_id]

  Dir.chdir "tasks/#{task_id}" do
    system 'bundle exec rubocop solution.rb' or exit(1)
    system 'bundle exec rspec --require ./solution.rb --color ./spec.rb' or exit(1)
  end
end
