require 'rspec'
require_relative '../person'
require_relative '../decorator'

describe Decorator do
  context 'testing the constructor' do
    it 'should return a Decorator object' do
      decorator = Decorator.new(Person.new(22, 'maximilianus'))
      expect(decorator).to be_an_instance_of(Decorator)
    end
  end

  context 'testing the correct_name method' do
    it 'should return the name of the person' do
      decorator = Decorator.new(Person.new(22, 'maximilianus'))
      expect(decorator.correct_name).to eq('maximilianus')
    end
  end
end
