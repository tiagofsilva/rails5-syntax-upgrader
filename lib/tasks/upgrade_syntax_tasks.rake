namespace :upgrade do
  namespace :syntax do
    desc "Upgrades Ruby's old hash rocket syntax to column syntax"
    task :hash, [:source] do |t, args|
      RubySyntaxUpgrader::UpgradeHashRocketSyntax.new(args.source).execute
    end

    desc "Upgrades Rails 3/4 controller tests to use Rails 5 syntax"
    task :controller_test_case, [:target] do |t, args|
      RubySyntaxUpgrader::UpgradeRails5TestCaseSyntax.new(args.target).execute
    end
  end  
end
