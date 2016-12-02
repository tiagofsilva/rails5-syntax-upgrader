module RubySyntaxUpgrader
	module RegexReplacer

		def regex_replace(source:, commit:, pattern:, replacement:)
			content = File.read(source).gsub(pattern, replacement)
			IO.write(source, content) if commit
			content
		end

	end
end
