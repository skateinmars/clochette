require 'rspec/core/rake_task'
require 'cane/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ['-r ./spec/spec_helper.rb']
  task.pattern = 'spec/**/*_spec.rb'
end

desc 'Run Cane to check quality metrics'
Cane::RakeTask.new(:quality) do |cane|
  cane.add_threshold 'coverage/.last_run.json', :>=, 99
  cane.abc_glob = '{lib,spec}/**/*.rb'
  cane.abc_max = 15
  cane.style_measure = 80
  cane.no_doc = true
end

desc 'Run all specs and check code quality'
task default: [:spec, :quality]
