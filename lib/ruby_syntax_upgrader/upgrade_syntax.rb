module RubySyntaxUpgrader
  class UpgradeSyntax

    attr_reader :source, :handler, :replacer

    def initialize(source, type)
      raise 'A source filepath is required' if source.nil?
      @source = source
      @handler = FileHandler.new(source)
      klass = Module.const_get(CLASS_FOR_FUNCTION[type])
      @replacer = klass.new
    end

    def execute
      handler.read_and_write_back do |files_contents|
        files_contents.map do |file_content|
          file_content[:content] = replacer.replace(file_content[:content])
          file_content
        end
      end
    end

  private

    CLASS_FOR_FUNCTION = {
      hash: 'RubySyntaxUpgrader::UpgradeHashRocketSyntax',
      test_case_verbs: 'RubySyntaxUpgrader::UpgradeControllerTestSyntax'
    }

  end

end
