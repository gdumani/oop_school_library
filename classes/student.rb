require_relative './person'

# Class for students, inherits from person
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @classroom.add_student student
  end

  def assign_classroom(classroom)
    @classroom - [self] unless @classroom.nil?
    @classroom = classroom
    @classroom.add_student self
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
