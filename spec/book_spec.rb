require 'rspec'
require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
  context 'testing the constructor' do
    it 'should return a Book object' do
      book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
      expect(book).to be_an_instance_of(Book)
    end
  end

  context 'testing the add_rental method' do
    it 'should add a rental to the rentals array' do
      book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
      person = Person.new(17, 'John')
      book.add_rental('2021/07/01', person)
      expect(book.rentals.length).to be_truthy
    end
  end
end
