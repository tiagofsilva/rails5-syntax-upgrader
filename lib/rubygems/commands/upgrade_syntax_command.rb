require_relative 'script'

class Gem::Commands::UpgradeSyntaxCommand < Gem::Command

	def initialize
		super 'upgrade_syntax', "Upgrades code's syntax to fit Ruby 2.3/Rails 5 reuirements"
	end

	def arguments
		'PATH                Path to the file/directory that you want to upgrade syntax'
	end

	def usage
		"#{program_name} PATH"
	end

	def description
		"Upgrades code's syntax to fit Ruby 2.3/Rails 5 requirements"
	end

	def execute
		upgrader = Rails5Upgrader.new(options[:args][0])
		upgrader.replace_hash_rocket
		upgrader.replace_requests_on_test_case_controller
	end

end


