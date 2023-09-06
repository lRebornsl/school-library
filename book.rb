class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rentals << Rental.new(date, person, self)
  end

  def to_json(*args)
    { title: @title, author: @author, book_id: Random.rand(1..1000) }.to_json(*args)
  end
end
