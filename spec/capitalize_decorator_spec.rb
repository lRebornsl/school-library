require 'rspec'
require_relative '../person'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  context 'testing the capitalized_person.correct_name method' do
    it 'should capitalize the name' do
      person = Person.new(22, 'maximilianus')
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq('Maximilianus')
    end
  end
end
