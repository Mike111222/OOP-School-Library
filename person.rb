require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(name:, age:, id: nil, parent_permission: true)
    super()
    @id = id.nil? ? Random.rand(100..10_000) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
  
  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def self.select(p_id, persons)
    persons.select { |person| person.id == p_id }.first
  end

  private

  def of_age
    @age.to_i >= 18
  end

end
