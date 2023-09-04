require_relative 'app'
require_relative 'books_handler'
require_relative 'rental_handler'

class ListHud
  def initialize
    @app = App.new
    @books = BooksHandler.new
    @rental_handler = RentalHandler.new(@app, @books)
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
      @app.list_persons
    when 3
      @app.add_person
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
