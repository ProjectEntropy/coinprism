# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  Bundler.setup(:default, :development)
  task :default => :spec
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "coinprism"
  gem.homepage = "http://github.com/ProjectEntropy/coinprism"
  gem.license = "MIT"
  gem.summary = "Ruby API Wrapper for CoinPrism Bitcoin Asset API"
  gem.description = "Ruby toolkit for working with the CoinPrism API"
  gem.email = "joran.k@gmail.com"
  gem.authors = ["Joran Kikke"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "coinprism #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
