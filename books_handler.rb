require_relative 'book'

class BooksHandler
  def initialize
    @books = []
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def list_books  
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end
end
