unless defined?(Bundler)
  require 'bundler/setup'
end

require 'rake/testtask'

task :default => :test

Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
  t.libs << 'lib' << 'test/lib'
  t.ruby_opts << '-rkeeping/test'
end
