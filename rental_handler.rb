require_relative 'rental'
require_relative 'input_handler'

class RentalHandler
  def initialize(persons, books)
    @rentals = []
    @books = books.books
    @persons = persons.persons
  end

  def rent_book
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}. Title: #{book.title} Author: #{book.author}"
    end
    book_index = InputHandler.get_integer_input('Enter the book number: ')

    puts 'Select a person from the following list by number'
    @persons.each_with_index do |person, index|
      puts "#{index}. Name: #{person.name} Age: #{person.age}"
    end
    person_index = InputHandler.get_integer_input('Enter the person number: ')

    date = InputHandler.get_string_input('Enter the date: ')

    @rentals << Rental.new(date, @books[book_index], @persons[person_index])
    puts 'Book rented successfully'
  end

  def list_rentals
    person_id = InputHandler.get_integer_input('ID of the person: ')
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title}"
      else
        puts 'No rentals found for this person'
      end
    end
  end

  def save_rentals(filename)
    puts 'Saving rentals...'
    puts @rentals.inspect
    File.write(filename, @rentals.to_json)
  end
end
