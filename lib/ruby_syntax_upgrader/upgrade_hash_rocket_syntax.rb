module RubySyntaxUpgrader
	class UpgradeHashRocketSyntax
		include RubySyntaxUpgrader::RegexReplacer

		attr_accessor :source, :commit

		def initialize(source:, commit: true)
			@source = source
			@commit = commit
			raise 'Source file must be passed' unless source
		end

		def execute
			files = File.file?(source) ? [source] : files_from_source_dir
			files.each do |file|
				regex_replace(
					file: file,
					commit: commit,
					pattern: HASH_ROCKET_REGEX[:pattern],
					replacement: HASH_ROCKET_REGEX[:replacement]
				)
			end
		end

	private

		HASH_ROCKET_REGEX = {
			pattern: /:([a-z0-9_]+)\s=>(\s[a-zA-Z0-9_.'"{}\[\]]+)/,
			replacement: '\1:\2'
		}

		def files_from_source_dir
			Dir[File.join(source, '**/*')]
				.select { |f| ['.rb', '.erb'].include?(File.extname(f)) }	
		end

	end
end
