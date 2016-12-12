module RubySyntaxUpgrader
	module RegexReplacer

		def regex_replace(inputs:, pattern:, replacement:)
			#files = File.file?(source) ? [source] : files_from_source
			# files.map do |file|
			# 	{
			# 		file: file, 
			# 		content: File.read(file).gsub(pattern, replacement)
			# 	}
			# end
			inputs.map { |input| input.gsub(pattern, replacement) }.flatten
		end

	private

		# def files_from_source
		# 	Dir[File.join(source, '**/*')]
		# 		.select { |f| ['.rb', '.erb'].include?(File.extname(f)) }	
		# end

	end
end
