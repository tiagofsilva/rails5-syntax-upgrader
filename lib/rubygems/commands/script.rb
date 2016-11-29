module RegexReplacer

	def regex_replace(filepath:, pattern:, replacement:)
		IO.write(filepath, File.open(filepath) do |f|
			f.read.gsub(pattern, replacement)
		end )
	end

end


class Rails5Upgrader
	include ::RegexReplacer

	attr_reader :filepath

	def initialize(filepath)
		@filepath = filepath
	end

	def replace_hash_rocket
		regex_replace(
			filepath: filepath, 
			pattern: HASH_ROCKET_REGEX[:pattern],
			replacement: HASH_ROCKET_REGEX[:replacement]
		)
	end

	def replace_requests_on_test_case_controller
		regex_replace(
			filepath: filepath,
			pattern: TEST_CASE_CONTROLLER_REQUEST_REGEX[:pattern],
			replacement: TEST_CASE_CONTROLLER_REQUEST_REGEX[:replacement]
		)
	end

	private 

	HASH_ROCKET_REGEX = {
		pattern: /:([a-z0-9_]+)\s=>(\s[a-zA-Z0-9_.'"{}]+)/, 
		replacement: '\1:\2'
	}

	TEST_CASE_CONTROLLER_REQUEST_REGEX = {
			pattern: /((get|post|patch|put|delete)\s(:[a-z0-9_]+)\,)((\s+[a-z0-9_]+:\s.+\,?)+)/,
			replacement: '\1 params: {\4 }'
	}

end
