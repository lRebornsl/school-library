require 'rspec'
require_relative '../person'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  context 'testing the trimmer_person.correct_name method' do
    it 'should trim the name' do
      person = Person.new(22, 'maximilianus')
      trimmer_person = TrimmerDecorator.new(person)
      expect(trimmer_person.correct_name).to eq('maximilian')
    end
  end
end
