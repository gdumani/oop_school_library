require_relative './decorator'
# capitalize name
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
