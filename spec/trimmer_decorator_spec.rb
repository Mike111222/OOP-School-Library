# trimmer_decorator_spec.rb

require_relative '../decorator'
require 'rspec'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'john_doe_is_a_long_name') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'trims the correct name from the decorated object if longer than 10 characters' do
      expect(decorator.correct_name).to eq('john_doe_i')
    end

    it 'returns the correct name without trimming if 10 characters or shorter' do
      nameable = double('Nameable', correct_name: 'short_name')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('short_name')
    end
  end
end
