require_relative 'spec_helper'

describe RubySyntaxUpgrader::FileHandler do

	subject { RubySyntaxUpgrader::FileHandler }

	let(:example_file) { './spec/temp/example_file.rb' }
	let(:example_dir) { './spec/temp' }

	describe '#read_and_write_back' do

		let(:handler) { subject.new(example_file) }
		let(:content) { File.read(example_file) }

		it 'raises custom error' do
			expect{handler.read_and_write_back}.to raise_error('FileHandler#read_and_write_back requires a block')
		end

		context 'when source is a file' do
			
			it 'reads source file succesfully' do
				expect(File).to receive(:read).with(example_file)
				handler.read_and_write_back { [] }
			end	

			it 'writes source file correctly' do
				expect(File).to receive(:write).with(example_file, content)
				handler.read_and_write_back { [{file: example_file, content: content}] }
			end
		end

		context 'when source is a directory' do
			let(:handler) { subject.new(example_dir) }

			it 'reads source directory succesfully' do
				expect(File).to receive(:read).with(example_file)
				handler.read_and_write_back { [] }
			end

			it 'writes source directory correctly' do
				expect(File).to receive(:write).with(example_file, File.read(example_file))
				handler.read_and_write_back { [{file: example_file, content: content}] }
			end
		end
	end

end
