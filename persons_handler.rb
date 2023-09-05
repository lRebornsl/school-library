require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class PersonsHandler
  attr_reader :persons

  def initialize
    @persons = []
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
end
