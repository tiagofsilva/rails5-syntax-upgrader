namespace :upgrade do
  namespace :syntax do
    desc "Upgrades Ruby's old hash rocket syntax to column syntax"
    task :hash, [:source] do |t, args|
      upgrade_syntax(args.source, t.name)
    end

    desc "Upgrades Rails controller tests to use Rails 5 syntax"
    task :controller_test_case, [:source] do |t, args|
      upgrade_syntax(args.source, t.name)
    end

    def upgrade_syntax(source, task)
      type = task.split(':').last
      RubySyntaxUpgrader::UpgradeSyntax.new(source, type.to_sym).execute
    end
  end  
end
