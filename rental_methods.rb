require_relative 'rental'

class RentalMethods
  attr_accessor :rentals_list

  def initialize(book_methods, person_methods)
    @rentals_list = []
    @book_methods = book_methods
    @person_methods = person_methods
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @book_methods.books_list.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_num = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @person_methods.people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, @book_methods.books_list[book_num], @person_methods.people_list[person_num]))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    if rentals_list.empty?
      puts 'No record found! Add a rental...'
    else
      puts "Available rentals in the library: #{rentals_list.count}"
      puts 'Select a person from the following list by id '
      @person_methods.people_list.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      id = gets.chomp.to_i
      puts 'Rentals:'
      @rentals_list.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
      end
    end
  end
end
