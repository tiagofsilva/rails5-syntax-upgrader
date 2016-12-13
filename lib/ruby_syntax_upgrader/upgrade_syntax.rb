module RubySyntaxUpgrader
	class UpgradeSyntax

		attr_reader :source, :handler, :replacer

		def initialize(source)
			raise 'A source filepath is required' if source.nil?
			@source = source
			@handler = FileHandler.new(source)
			@replacer = UpgradeHashRocketSyntax.new
		end

		def execute
			handler.read do |files_contents|
				files_contents.map do |file_content|
					file_content[:content] = replacer.replace(file_content[:content])
					file_content
				end
			end
			.write_back
		end

	end
end
