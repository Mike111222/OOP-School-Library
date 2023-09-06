require_relative '../book'
require 'rspec'

describe Book do
  let(:book) { Book.new(title: 'Sample Book', author: 'Sample Author') }

  describe '#initialize' do
    it 'creates a book with default values' do
      expect(book.id).to be_an(Integer)
      expect(book.title).to eq('Sample Book')
      expect(book.author).to eq('Sample Author')
      expect(book.rentals).to be_empty
    end

    it 'creates a book with a specified id' do
      book_with_id = Book.new(title: 'Another Book', author: 'Another Author', id: 42)
      expect(book_with_id.id).to eq(42)
    end
  end

  it 'adds a rental to the book' do
    person = Person.new(name: 'John Doe', age: 30) # Create a Person object
    rental = book.add_rental('2023-08-31', person)
    expect(book.rentals).to include(rental)
  end

  describe '#to_s' do
    it 'returns a string representation of the book' do
      expect(book.to_s).to eq('Title: Sample Book, Author: Sample Author')
    end
  end
end
