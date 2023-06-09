require_relative './person'

# Class for students, inherits from person
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @classroom.add_student self
  end

  def assign_classroom(classroom)
    @classroom.students -= [self] unless @classroom.nil?
    @classroom = classroom
    @classroom.students << self
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
