require 'rspec'
require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  describe '#initialize' do
    it 'creates a new instance of Rental' do
      book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
      person = Person.new(17, 'John')
      rental = Rental.new('2021-07-06', book, person)
      expect(rental).to be_a(Rental)
    end
  end
end
