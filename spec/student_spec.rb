require 'rspec'
require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'testing the constructor' do
    it 'should return a Student object' do
      student = Student.new(17, 'John', 'A')
      expect(student).to be_an_instance_of(Student)
    end
  end

  context 'testing the play_hooky method' do
    it 'should return ¯\(ツ)/¯' do
      student = Student.new(17, 'John', 'A')
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
