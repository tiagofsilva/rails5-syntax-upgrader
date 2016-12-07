require_relative 'spec_helper'

describe RubySyntaxUpgrader::UpgradeHashRocketSyntax do

  let!(:colon_hash_example) do
    """
    a = { bar: foo }
    b = { bar: [1,2,3] }
    c = { bar: 'foo', baz: 'foo' }
    d = {bar: 10 }
    e = { a: { b: { c: {} } } }
    f = { bar: {foo: :foobar}}
    g = bar: /[a-z0-9]*/
    h = bar: /(.+)[:a-z]/
    i = { bar: { foo: :baz } }
    j = { bar: 1, foo: 2, baz: 3 }
    """
  end

  let!(:hash_rocket_example) do
    """
    a = { :bar => foo }
    b = { :bar => [1,2,3] }
    c = { :bar=> 'foo', :baz => 'foo' }
    d = {:bar=> 10 }
    e = { :a=> { :b=> { :c=> {} } } }
    f = { :bar=> {:foo=>:foobar}}
    g = :bar => /[a-z0-9]*/
    h = :bar => /(.+)[:a-z]/
    i = { :bar => { foo: :baz } }
    j = { :bar => 1, foo: 2, baz: 3 }
    """
  end

  let(:hash_rocket_example_path) { './spec/temp' }
  let(:hash_rocket_example_file) { "#{hash_rocket_example_path}/example_file.rb" }

  before do
    @source = File.open(hash_rocket_example_file, 'w') do |f|
                f.write(hash_rocket_example)
              end
  end

  after do
    File.open(hash_rocket_example_file, 'w') do |f|
      f.write('')
    end
  end

	describe '#new' do
		context 'when no argument is passed' do
      it 'raises a ArgumentError' do
        expect{ RubySyntaxUpgrader::UpgradeHashRocketSyntax.new }
          .to raise_error(ArgumentError)
      end
    end
	end

  describe '#execute' do
    subject { RubySyntaxUpgrader::UpgradeHashRocketSyntax
              .new(hash_rocket_example_path) 
            }

    it 'replaces file content' do
      subject.execute
      content = File.read(hash_rocket_example_file)
      expect(content).to eq colon_hash_example
    end

    it 'returns all selected for the given source path' do
      files = subject.execute
      expect(files).to eq [hash_rocket_example_file]
    end

  end
end