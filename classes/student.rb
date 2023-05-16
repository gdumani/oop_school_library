require './person'

# Class for students, inherits from person
class Student < Person
  def initialize(name, age, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end
