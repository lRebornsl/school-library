require_relative 'book'
require_relative 'input_handler'

class BooksHandler
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book
    title = InputHandler.get_string_input('Title: ')
    author = InputHandler.get_string_input('Author: ')
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end
end
