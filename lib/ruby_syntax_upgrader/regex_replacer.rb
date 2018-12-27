module RubySyntaxUpgrader
  module RegexReplacer

    def regex_replace(input:, pattern:, replacement:)
      input.gsub(pattern, replacement)
    end

  end
end
