module RubySyntaxUpgrader
	module RegexReplacer

		def regex_replace(file:, commit:, pattern:, replacement:)
			content = File.read(file).gsub(pattern, replacement)
			IO.write(file, content) if commit
			content
		end

	end
end
