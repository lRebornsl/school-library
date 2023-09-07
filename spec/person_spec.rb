require 'rspec'
require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  context 'testing the constructor' do
    it 'should return a Person object' do
      person = Person.new(17)
      expect(person).to be_an_instance_of(Person)
    end
  end

  context 'testing the can_use_services? method' do
    it 'should return true if the person is of age' do
      person = Person.new(18)
      expect(person.can_use_services?).to eq(true)
    end
  end

  context 'testing the correct_name method' do
    it 'should return the name of the person' do
      person = Person.new(17, 'John')
      expect(person.correct_name).to eq('John')
    end
  end

  context 'testing the add_rental method' do
    it 'should add a rental to the rentals array' do
      person = Person.new(17, 'John')
      book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
      person.add_rental('2021-07-01', book)
      expect(person.rentals.length).to be_truthy
    end
  end

  context 'testing the of_age? method' do
    it 'should return true if the person is of age' do
      person = Person.new(18)
      expect(person.send(:of_age?)).to eq(true)
    end
  end
end
