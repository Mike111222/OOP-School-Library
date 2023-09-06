require 'json'

class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(title:, author:, id: nil)
    @id = id.nil? ? Random.rand(100..10_000) : id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
   Rental.new(date, person, self)
  end

  def to_s
    "Title: #{title}, Author: #{author}"
  end

  def to_json(*args)
    JSON.dump({
      id: @id,
      title: @title,
      author: @author,
    })
  end

  def self.from_json(json_string)
    data = JSON.parse json_string
    new(id: data['id'], title: data['title'], author: data['author'])
  end

  def self.select(book_id, books)
    books.select { |book| book.id == book_id }.first
  end
end
