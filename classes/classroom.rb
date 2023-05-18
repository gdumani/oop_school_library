# Class for Classroom
class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @studnts << student
    student.assign_classroom << self
  end
end
