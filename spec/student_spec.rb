require_relative '../student'
require_relative '../classroom'
require 'rspec'

describe Student do
  let(:student) { Student.new(name: 'Student Name', age: 18) }

  describe '#initialize' do
    it 'creates a student with default values' do
      expect(student.id).to be_an(Integer)
      expect(student.name).to eq('Student Name')
      expect(student.age).to eq(18)
      expect(student.rentals).to be_empty
      expect(student.can_use_services?).to be_truthy
    end

    it 'creates a student with a specified id' do
      student_with_id = Student.new(name: 'Alice', age: 16, id: 42)
      expect(student_with_id.id).to eq(42)
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom for a student' do
      classroom = Classroom.new('Class A')
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end
  end
end
