module RubySyntaxUpgrader
	module RegexReplacer

		attr_accessor :source

		def regex_replace(source:, pattern:, replacement:)
			files = File.file?(source) ? [source] : files_from_source
			files.each do |file|
				content = File.read(file).gsub(pattern, replacement)
				IO.write(file, content)
			end
			files
		end

	private

		def files_from_source
			Dir[File.join(source, '**/*')]
				.select { |f| ['.rb', '.erb'].include?(File.extname(f)) }	
		end

	end
end
