require 'bundler/gem_tasks'

require_relative 'lib/ruby_syntax_upgrader'
load 'lib/tasks/upgrade_syntax_tasks.rake'

# RSpec
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task default: 'spec'
