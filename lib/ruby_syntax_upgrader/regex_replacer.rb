module RubySyntaxUpgrader
	module RegexReplacer

		def regex_replace(inputs:, pattern:, replacement:)
			inputs.map { |input| input.gsub(pattern, replacement) }.flatten
		end

	end
end
