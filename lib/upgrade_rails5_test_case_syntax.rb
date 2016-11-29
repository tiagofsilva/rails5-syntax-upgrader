require_relative 'regex_replacer'

class RubySyntaxUpgrader::UpgradeRails5TestCaseSyntax
  include ::RegexReplacer

  attr_reader :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def execute
    regex_replace(
      filepath: filepath,
      pattern: TEST_CASE_CONTROLLER_REQUEST_REGEX[:pattern],
      replacement: TEST_CASE_CONTROLLER_REQUEST_REGEX[:replacement]
    )
  end

  private

  TEST_CASE_CONTROLLER_REQUEST_REGEX = {
      pattern: /((get|post|patch|put|delete)\s(:[a-z0-9_]+)\,)((\s+[a-z0-9_]+:\s.+\,?)+)/,
      replacement: '\1 params: {\4 }'
  }

end


