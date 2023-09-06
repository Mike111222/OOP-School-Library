# spec/classroom_spec.rb
require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom_label) { 'Math' }
  let(:classroom) { Classroom.new(classroom_label) }

  let(:student_data) { { id: 1, name: 'John Doe', age: 35, parent_permission: true } }
  subject(:student) { described_class.new(**student_data) }

  describe '#initialize' do
    it 'initializes a Classroom object with the correct label' do
      expect(classroom.label).to eq(classroom_label)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student method' do
    it "should add a student to the classroom's students list" do
      classroom = Classroom.new('Math')
      student = Student.new(name: 'Student1', age: 15)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'should set the classroom of the student to the current classroom' do
      classroom = Classroom.new('Math')
      student = Student.new(name: 'Student1', age: 15)
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end

    it 'returns the students array' do
      expect(classroom.students).to be_an(Array)
    end

    it 'returns the students array with the added student' do
      classroom = Classroom.new('Math')
      student = Student.new(name: 'Student1', age: 15)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
