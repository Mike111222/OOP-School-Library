# spec/teacher_spec.rb
require 'rspec'
require_relative '../teacher' # Adjust the path as needed

describe Teacher do
  let(:teacher_data) { { id: 1, name: 'John Doe', age: 35, specialization: 'Math' } }

  subject(:teacher) { described_class.new(**teacher_data) }

  describe '#initialize' do
    it 'initializes a Teacher object with the correct attributes' do
      expect(teacher.id).to eq(1)
      expect(teacher.name).to eq('John Doe')
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be_truthy
    end
  end

  describe '#to_s' do
    it 'returns a formatted string representation of the Teacher object' do
      expect(teacher.to_s).to eq('[Teacher] Name: John Doe, ID: 1, Age: 35')
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the Teacher object' do
      json_data = JSON.dump({
        type: 'Teacher',
        id: 1,
        name: 'John Doe',
        age: 35,
        specialization: 'Math'
      })
      expect(teacher.to_json).to eq(json_data)
    end
  end

  describe '.from_json' do
    it 'creates a Teacher object from JSON data' do
      json_data = JSON.dump({
        type: 'Teacher',
        id: 1,
        name: 'John Doe',
        age: 35,
        specialization: 'Math'
      })

      new_teacher = Teacher.from_json(json_data)

      expect(new_teacher.id).to eq(1)
      expect(new_teacher.name).to eq('John Doe')
      expect(new_teacher.age).to eq(35)
      expect(new_teacher.specialization).to eq('Math')
    end
  end
end
