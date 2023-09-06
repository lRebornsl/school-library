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
    { title: @title, author: @author, rentals: @rentals.map(&:to_json) }.to_json(*args)
  end
end
