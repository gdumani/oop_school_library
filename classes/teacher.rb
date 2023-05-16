require './person'

# class for teacher inherits from person.
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
