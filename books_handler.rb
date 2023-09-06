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

  def save_books(filename)
    File.write(filename, @books.to_json)
  end

  def load_books(filename)
    if File.exist?(filename)
      @books = JSON.parse(File.read(filename)).map do |b|
        Book.new(b['title'], b['author'])
      end
    else
      File.write(filename, '[]')
    end
  end
end
