require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, classroom, parent_permission: true)
    classroom = Classroom.new(classroom)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
