require_relative 'rental'

class RentalHandler
  def initialize(app, books)
    @rentals = []
    @books = books.books
    @persons = app.persons
  end

  def rent_book
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}. Title: #{book.title} Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    @persons.each_with_index do |person, index|
      puts "#{index}. Name: #{person.name} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @persons[person_index])
    puts 'Book rented successfully'
  end

  def list_rentals
    print 'ID of the person: '
    person_id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title}"
      else
        puts 'No rentals found for this person'
      end
    end
  end
end
