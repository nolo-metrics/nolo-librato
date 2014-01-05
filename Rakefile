require 'bundler/gem_tasks'

require 'rdoc/task'
RDoc::Task.new

require "rake/testtask"
Rake::TestTask.new do |test|
  test.test_files = Dir['test/**/test_*.rb']
  test.verbose = true
end
task :default => :test

# vim: syntax=ruby
