module RubySyntaxUpgrader
  class UpgradeHashRocketSyntax
    include RubySyntaxUpgrader::RegexReplacer

    def replace(input)
      return if input.nil?

      regex_replace(
        input: input,
        pattern: HASH_ROCKET_REGEX[:pattern],
        replacement: HASH_ROCKET_REGEX[:replacement]
      )
    end

  private

    RUBY_SYMBOL_REGEX = /:([a-z0-9_]+)/
    MULTIPLE_TYPES_OR_SYMBOL_REGEX = /(\s)?([a-zA-Z0-9_.'"{}\[\]\/]+|#{RUBY_SYMBOL_REGEX})/

    HASH_ROCKET_REGEX = {
      pattern: Regexp.new(/#{RUBY_SYMBOL_REGEX}\s?=>#{MULTIPLE_TYPES_OR_SYMBOL_REGEX}/),
      replacement: '\1: \3'
    }

  end
end
