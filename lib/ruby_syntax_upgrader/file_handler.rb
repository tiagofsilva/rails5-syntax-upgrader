module RubySyntaxUpgrader
	class FileHandler

		attr_reader :source, :updated_input

		def initialize(source)
			@source = source
		end

		def read
			input = files_from_source.map { |file| { file: file, content: File.read(file) } }
			@updated_input = yield(input)
			self
		end

		def write_back
			updated_input.flatten.each do |file_content|
				File.write(file_content[:file], file_content[:content])
			end
		end

	private

		def files_from_source
			if File.file?(source)
				[source]
			else
				Dir[File.join(source, '**/*')]
					.select { |filename| ['.rb', '.erb'].include?(File.extname(filename)) }
			end
		end

	end
end