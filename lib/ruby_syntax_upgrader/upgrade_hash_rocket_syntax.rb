module RubySyntaxUpgrader
	class UpgradeHashRocketSyntax
		include RubySyntaxUpgrader::RegexReplacer

		attr_reader :filepath

		def initialize(filepath)
			@filepath = filepath
		end

		def execute
			regex_replace(
				filepath: filepath, 
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
