require_relative 'spec_helper'

describe RubySyntaxUpgrader::UpgradeHashRocketSyntax do

  describe '#replace' do

    subject { RubySyntaxUpgrader::UpgradeHashRocketSyntax.new }

    context 'when nil is passed' do
      it 'returns nil' do
        expect(subject.replace(nil)).to eq nil
      end
    end

    it 'replaces variable value' do
      expect(subject.replace('a = { :bar => foo }')).to eq 'a = { bar: foo }'
    end

    it 'replaces array value' do
      expect(subject.replace('b = { :bar => [1,2,3] }')).to eq 'b = { bar: [1,2,3] }'
    end

    it 'replaces string value' do
      expect(subject.replace("c = { :bar=> 'foo', :baz => 'foo' }")).to eq "c = { bar: 'foo', baz: 'foo' }"
    end

    it 'replaces integer value' do
      expect(subject.replace('d = {:bar=> 10 }')).to eq 'd = {bar: 10 }'
    end

    it 'replaces float value' do
      expect(subject.replace('d = {:bar=> 10.63 }')).to eq 'd = {bar: 10.63 }'
    end

    it 'replaces nested hashes' do
      expect(subject.replace("e = { :a=> { :b=> { :c=> {} } } }")).to eq "e = { a: { b: { c: {} } } }"
    end

    it 'replaces nested hashes with no spaces' do
      expect(subject.replace("f = { :bar=> {:foo=>:foobar}}")).to eq "f = { bar: {foo: :foobar}}"
    end

    it 'replaces regex value' do
      expect(subject.replace("g = :bar => /:[a-z0-9]*/")).to eq "g = bar: /:[a-z0-9]*/"
    end

    it 'replaces only hash-rocket when there is both syntaxes' do
      expect(subject.replace("i = { :bar => { foo: :baz } }")).to eq "i = { bar: { foo: :baz } }"
    end

    it 'replaces only hash-rocket syntax in a nested hash with both syntaxes' do
      expect(subject.replace("j = { :bar => 1, foo: 2, baz: 3 }")).to eq "j = { bar: 1, foo: 2, baz: 3 }"
    end

  end

end