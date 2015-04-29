lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nolo-librato/version'
require 'bundler/gem_tasks'

require 'rake/clean'
require 'rdoc/task'
RDoc::Task.new

require "rake/testtask"
Rake::TestTask.new do |test|
  test.test_files = Dir['test/**/test_*.rb']
  test.verbose = true
end
task :default => :test

task 'deb' => 'build' do
  sh "fpm -s gem \
          -t deb \
          -d ruby2.0 \
          --gem-package-name-prefix ruby \
          -n nolo-librato \
          --after-install dist/after-install.sh \
          --after-remove dist/after-remove.sh \
          pkg/nolo-librato-#{Nolo::Librato::VERSION}.gem"
end

task 'upload-ubuntu-trusty' => 'deb' do
  sh "package_cloud push josephholsten/nolo/#{ENV['DISTRO']} nolo-librato_#{Nolo::Librato::VERSION}_all.deb"
end

task upload: 'upload-ubuntu-trusty'

CLOBBER << Dir['*.deb']
CLOBBER << Dir['pkg/*.gem']

# vim: syntax=ruby
