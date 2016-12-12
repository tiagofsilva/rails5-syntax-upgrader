namespace :upgrade do
  namespace :syntax do
    desc "Upgrades Ruby's old hash rocket syntax to column syntax"
    task :hash, [:source] do |t, args|
      RubySyntaxUpgrader::UpgradeHashRocketSyntax.new(args.source).execute
    end

    desc "Upgrades Rails controller tests to use Rails 5 syntax"
    task :controller_test_case, [:source] do |t, args|
      RubySyntaxUpgrader::UpgradeControllerTestSyntax.new(args.source).execute
    end
  end  
end
