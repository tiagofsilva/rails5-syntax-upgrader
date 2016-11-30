require_relative '../regex_replacer'
require_relative '../upgrade_hash_rocket_syntax'
require_relative '../upgrade_rails5_test_case_syntax'

namespace :upgrade_syntax do
  desc "Upgrades Ruby's old hash rocket syntax to column syntax"
  task :hash_rocket, [:target] do |t, args|
    UpgradeHashRocketSyntax.new(args.target).execute
  end

  desc "Upgrades Rails 3/4 controller tests to use Rails 5 syntax"
  task :rails5_test_case, [:target] do |t, args|
    UpgradeRails5TestCaseSyntax.new(args.target).execute
  end
end