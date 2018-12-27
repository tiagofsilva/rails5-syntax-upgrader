require 'rake'

module RubySyntaxUpgrader
  extend Rake::DSL

  namespace :upgrade do
    namespace :syntax do
      desc "Upgrades Ruby's old hash rocket syntax to column syntax"
      task :hash, [:source] do |t, args|
        Helper.upgrade_syntax(args.source, t.name)
      end

      desc "Upgrades Rails controller tests to use Rails 5 syntax"
      task :controller_test_case, [:source] do |t, args|
        Helper.upgrade_syntax(args.source, t.name)
      end
    end
  end

  module Helper
    def self.upgrade_syntax(source, task)
      type = task.split(':').last
      RubySyntaxUpgrader::UpgradeSyntax.new(source, type.to_sym).execute
    end
  end
end

require_relative 'ruby_syntax_upgrader/regex_replacer'
require_relative 'ruby_syntax_upgrader/file_handler'
require_relative 'ruby_syntax_upgrader/upgrade_syntax'
require_relative 'ruby_syntax_upgrader/upgrade_hash_rocket_syntax'
require_relative 'ruby_syntax_upgrader/upgrade_controller_test_syntax'
