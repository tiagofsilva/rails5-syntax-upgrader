require_relative 'spec_helper'

describe RubySyntaxUpgrader::UpgradeHashRocketSyntax do

  let(:hash_rocket_source_path) { 'spec/examples/hash_rocket_examples.txt' }

	describe '#new' do
		context 'when no argument is passed' do
      it 'raises a ArgumentError' do
        expect{ RubySyntaxUpgrader::UpgradeHashRocketSyntax.new }
          .to raise_error(ArgumentError)
      end
    end

    context 'when source is empty' do
      it 'raises a custom error' do
        expect{ RubySyntaxUpgrader::UpgradeHashRocketSyntax.new(source: nil) }
          .to raise_error('Source file must be passed')
      end
    end
	end

  describe '#execute' do

    context 'when commit is false' do
      subject { RubySyntaxUpgrader::UpgradeHashRocketSyntax
                .new(source: hash_rocket_source_path, commit: false) 
              }

      let!(:expected_content) { File.read('spec/examples/colon_hash_examples.txt') }

      it 'replaces content without commiting' do
        result_content = subject.execute
        expect(result_content).to eq expected_content
      end
    end

  end
end