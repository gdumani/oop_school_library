require_relative './decorator'
# Trimmer decorator for nameable
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
