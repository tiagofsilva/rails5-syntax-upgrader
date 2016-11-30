require_relative '../regex_replacer'
require_relative '../upgrade_hash_rocket_syntax'
require_relative '../upgrade_rails5_test_case_syntax'

namespace :upgrade do
  namespace :syntax do
    desc "Upgrades Ruby's old hash rocket syntax to column syntax"
    task :hash, [:target] do |t, args|
      UpgradeHashRocketSyntax.new(args.target).execute
    end

    desc "Upgrades Rails 3/4 controller tests to use Rails 5 syntax"
    task :controller_test_case, [:target] do |t, args|
      UpgradeRails5TestCaseSyntax.new(args.target).execute
    end
  end  
end
