require_relative '../decorator'
require 'rspec'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'john_doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct name from the decorated object' do
      expect(decorator.correct_name).to eq('John_doe')
    end
  end
end
