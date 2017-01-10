module RubySyntaxUpgrader
  class UpgradeControllerTestSyntax
    include RubySyntaxUpgrader::RegexReplacer

    def replace(input)
      return if input.nil?

      regex_replace(
        input: input,
        pattern: TEST_CASE_CONTROLLER_REQUEST_REGEX[:pattern],
        replacement: TEST_CASE_CONTROLLER_REQUEST_REGEX[:replacement]
      )
    end

  private

    RUBY_SYMBOL_REGEX = /:[a-z0-9_]+/
    RUBY_STRING_REGEX = /[a-z0-9_'"]+/
    CONTROLLER_ACTION_REGEX = /#{RUBY_SYMBOL_REGEX}|#{RUBY_STRING_REGEX}/
    HTTP_METHODS_REGEX = /get|post|patch|put|delete/

    TEST_CASE_CONTROLLER_REQUEST_REGEX = {
        pattern: /((#{HTTP_METHODS_REGEX})\s(#{CONTROLLER_ACTION_REGEX})\,)((\s+[a-z0-9_]+:\s+.+\,?)+)/,
        replacement: '\1 params: {\4 }'
    }
    
  end
end
