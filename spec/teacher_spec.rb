require 'rspec'
require_relative '../teacher'

describe Teacher do
  context 'testing the constructor' do
    it 'should return a Teacher object' do
      teacher = Teacher.new(34, 'Jane Doe', 'Math')
      expect(teacher).to be_an_instance_of(Teacher)
    end
  end
  context 'testing the can_use_services? method' do
    it 'should return true' do
      teacher = Teacher.new(34, 'Jane Doe', 'Math')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
