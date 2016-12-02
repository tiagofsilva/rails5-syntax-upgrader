module RubySyntaxUpgrader
	class UpgradeHashRocketSyntax
		include RubySyntaxUpgrader::RegexReplacer

		attr_accessor :source
		attr_reader :commit

		def initialize(source:, commit: true)
			@source = source
			@commit = commit
			raise 'Source file must be passed' unless source
		end

		def execute
			puts regex_replace(
				source: source,
				commit: commit,
				pattern: HASH_ROCKET_REGEX[:pattern],
				replacement: HASH_ROCKET_REGEX[:replacement]
			)
		end

		private

		HASH_ROCKET_REGEX = {
			pattern: /:([a-z0-9_]+)\s=>(\s[a-zA-Z0-9_.'"{}\[\]]+)/, 
			replacement: '\1:\2'
		}

	end
end
