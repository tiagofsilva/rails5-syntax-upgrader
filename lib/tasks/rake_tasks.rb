require 'rake'

module RubySyntaxUpgrader
  class TasksSetup
    include Rake::DSL if defined? Rake::DSL
    def setup
      load 'upgrade_syntax_tasks.rake'
    end
  end 
end

RubySyntaxUpgrader::TasksSetup.new.setup