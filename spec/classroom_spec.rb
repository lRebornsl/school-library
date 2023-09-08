require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'testing the constructor' do
    it 'should return a Classroom object' do
      classroom = Classroom.new('Math')
      expect(classroom).to be_an_instance_of(Classroom)
    end
  end
  context 'testing the add_student method' do
    it 'should return a Student object' do
      classroom = Classroom.new('Math')
      student = Student.new(17, 'John', 'A')
      classroom.add_student(student)
      expect(student).to be_an_instance_of(Student)
    end
  end
end
