require_relative 'app'

class ListHud
  def initialize
    @app = App.new
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
      @app.list_books
    when 2
      @app.list_persons
    when 3
      @app.add_person
    when 4
      @app.add_book
    when 5
      @app.rent_book
    when 6
      @app.list_rentals
    else
      puts 'Invalid choice'
    end
  end
end
