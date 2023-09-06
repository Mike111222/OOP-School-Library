require_relative '../rental'
require_relative '../teacher'
require_relative '../student'
require_relative '../book'

describe Rental do
  describe 'creates a Rental instance' do
    it 'An instance of Rental class' do
      person = Teacher.new(name: 'John Doe', age: 35, specialization: 'Mathematics')
      book = Book.new(title: 'Mathematic fond', author: 'ttt')
      rental = Rental.new('2020-11-11', book, person)
      expect(rental).to be_an_instance_of Rental
    end

    it 'the date attribute for the rental is "2020-11-11"' do
      person = Teacher.new(name: 'John Doe', age: 35, specialization: 'Mathematics')
      book = Book.new(title: 'Mathematic fond', author: 'ttt')
      rental = Rental.new('2020-11-11', book, person)
      expect(rental.date).to eql '2020-11-11'
    end

    it 'the book attribute for the rental is an instance of Book' do
      person = Teacher.new(name: 'John Doe', age: 35, specialization: 'Mathematics')
      book = Book.new(title: 'Mathematic fond', author: 'ttt')
      rental = Rental.new('2020-11-11', book, person)
      expect(rental.book).to be_an_instance_of Book
    end

    it 'the person attribute for the rental is an instance of Teacher' do
      person = Teacher.new(name: 'John Doe', age: 35, specialization: 'Mathematics')
      book = Book.new(title: 'Mathematic fond', author: 'ttt')
      rental = Rental.new('2020-11-11', book, person)
      expect(rental.person).to be_an_instance_of Teacher
    end
  end

  describe 'Rental: book' do
    it 'rental: which book?' do
      person = Teacher.new(name: 'John Doe', age: 35, specialization: 'Mathematics')
      book = Book.new(title: 'Mathematic fond', author: 'ttt')
      rental = Rental.new('2020-11-11', book, person)
      expect(book.rentals).to include rental
    end
  end

  describe 'Rental: person' do
    it 'rental: who?' do
      person = Student.new(name: 'Kate', age: 22, parent_permission: true)
      book = Book.new(title: 'The last Supper', author: 'The God')
      rental = Rental.new('2021-09-06', book, person)
      expect(person.rentals).to include rental
    end
  end

  describe 'Rental: to JSON' do
    it '\'to_json\' method returns JSON hash object' do
      person = Student.new(name: 'Kate', age: 22, parent_permission: true)
      book = Book.new(title: 'The last Supper', author: 'The God')
      rental = Rental.new('2021-09-06', book, person)
      expect(rental.to_json).to be_an_instance_of String
      expect(JSON.parse(rental.to_json)).to be_an_instance_of Hash
    end

    it '\'to_json\' returned value is parsed to a Hash' do
      person = Student.new(name: 'Kate', age: 22, parent_permission: true)
      book = Book.new(title: 'The last Supper', author: 'The God')
      rental = Rental.new('2021-09-06', book, person)
      expect(JSON.parse(rental.to_json)).to be_an_instance_of Hash
    end
  end
end
