namespace :upgrade_syntax do
  desc "Upgrades Ruby's old hash rocket syntax to column syntax"
  task :hash_rocket, [:target] => :environment do |t, args|
    UpgradeHashRocketSyntax.new(args.target).execute
  end

  task :rails5_test_case, [:target] => :environment do |t, args|
    UpgradeRails5TestCaseSyntax.new(args.target).execute
  end
end