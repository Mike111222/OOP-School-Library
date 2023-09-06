require 'json'
require_relative 'book'
require_relative 'person'
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_s
    "Date: #{@date}, Book: \"#{@book.title}\" by #{@book.author}"
  end

  def to_json(*_args)
    JSON.dump({
                date: @date,
                book_id: @book.id,
                person_id: @person.id
              })
  end

  def self.from_json(string, books, persons)
    data = JSON.parse string
    book_id = data['book_id']
    person_id = data['person_id']
    book = Book.select(book_id, books)
    person = Person.select(person_id, persons)
    new(data['date'], book, person)
  end
end
