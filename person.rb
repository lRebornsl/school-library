require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rentals << Rental.new(date, book, self)
  end

  def to_json(*)
    if is_a? Student
      { type: 'Student', name: @name, age: @age, parent_permission: @parent_permission, person_id: @id }.to_json(*)
    elsif is_a? Teacher
      { type: 'Teacher', name: @name, age: @age, person_id: @id }.to_json(*)
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
