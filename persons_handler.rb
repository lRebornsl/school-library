require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'input_handler'

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
    person_type = InputHandler.get_integer_input('Do you want to add a student (1) or a teacher (2)?: ')
    if person_type == 1
      add_student
    elsif person_type == 2
      add_teacher
    else
      puts 'Invalid option'
    end
  end

  def add_student
    name = InputHandler.get_string_input('Name: ')
    age = InputHandler.get_integer_input('Age: ')
    classroom_name = InputHandler.get_string_input('Classroom: ')
    classroom = Classroom.new(classroom_name)
    permission = InputHandler.get_yes_no_input('Has a parent permission?')
    
    @persons << Student.new(age, name, classroom, parent_permission: permission)
    puts 'Student created successfully'
  end

  def add_teacher
    name = InputHandler.get_string_input('Name: ')
    age = InputHandler.get_integer_input('Age: ')
    specialization = InputHandler.get_string_input('Specialization: ')
    
    @persons << Teacher.new(age, name, specialization)
    puts 'Teacher created successfully'
  end
end
