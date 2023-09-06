require_relative 'books_handler'
require_relative 'rental_handler'
require_relative 'persons_handler'
require 'json'

class App
  def initialize
    @books = BooksHandler.new
    @persons = PersonsHandler.new
    @rental_handler = RentalHandler.new(@persons, @books)
  end

  def run
    @persons.load_persons('./src/persons.json')
    loop do
      display_options
      choice = gets.chomp.to_i
      if choice == 7
        @persons.save_persons('./src/persons.json')
        puts 'Bye!'
        break
      end
      option(choice)
    end
  end

  def display_options
    puts '1. List all books'
    puts '2. List all persons'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Quit'
  end

  def option(choice)
    case choice
    when 1
      @books.list_books
    when 2
      @persons.list_persons
    when 3
      @persons.add_person
    when 4
      @books.add_book
    when 5
      @rental_handler.rent_book
    when 6
      @rental_handler.list_rentals
    else
      puts 'Invalid choice'
    end
  end
end
