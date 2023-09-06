require_relative '../decorator'
require 'rspec'

describe Decorator do
  let(:nameable) { double('Nameable', correct_name: 'john_doe') }
  let(:decorator) { Decorator.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct name from the decorated object' do
      expect(decorator.correct_name).to eq('john_doe')
    end
  end
end
