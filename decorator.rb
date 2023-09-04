require 'nameable'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super() # This is important to call the initialize method of the parent class
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0..9] : name
  end
end
