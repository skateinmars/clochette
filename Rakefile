# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Clochette::Application.load_tasks

desc 'Run all specs and check code quality'
task default: [:spec, :quality]
