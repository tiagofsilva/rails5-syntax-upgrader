module RubySyntaxUpgrader
	module RegexReplacer

		def regex_replace(source:, commit:, pattern:, replacement:)
			if commit
				result = nil
				IO.write(source, File.open(source) do |f|
					result = f.read.gsub(pattern, replacement)
				end )
				result
			else
				File.open(source).read.gsub(pattern, replacement)
			end
		end

	end
end
