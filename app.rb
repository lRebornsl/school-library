require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'rental'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def run
    display_options
    choice = gets.chomp.to_i
    while choice != 7
      option(choice)
      display_options
      choice = gets.chomp.to_i
    end
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_persons
    @persons.each do |person|
      if person.instance_of?(Teacher)
        puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      else
        puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def add_person
    print 'Do you want to add a student (1) or a teacher (2)?'
    person_type = gets.chomp.to_i
    if person_type == 1
      add_student
    elsif person_type == 2
      add_teacher
    else
      puts 'Invalid option'
    end
  end

  def add_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Classroom: '
    classroom_name = gets.chomp
    classroom = Classroom.new(classroom_name)
    print 'Has a parent permission? (Y/N)'
    permission = gets.chomp.downcase
    if permission == 'y'
      @persons << Student.new(name, age, classroom)
      puts 'Student created successfully'
    elsif permission == 'n'
      @persons << Student.new(name, age, classroom, parent_permission: false)
      puts 'Student created successfully'
    else
      puts 'Invalid option'
    end
  end

  def add_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    @persons << Teacher.new(name, age, specialization)
    puts 'Teacher created successfully'
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
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
