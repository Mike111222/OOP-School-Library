require './student'
require './teacher'
require './book'
require './rental'
require './file_handler'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No record found! Add some books...'
    else
      puts 'Available books in the library'
      @books.each { |book| puts book }
    end
  end

  def list_all_people
    if @persons.empty?
      puts 'No record found! Add a person...'
    else
      puts 'All people in the library'
      @persons.each do |person|
        puts person
      end
    end
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    person_role = gets.chomp
    case person_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please add a valid input!'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    @persons.push(Student.new(age: age, name: name, parent_permission: parent_permission))
    puts
    puts 'Person created successfuly'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @persons.push(Teacher.new(age: age, specialization: specialization, name: name))
    puts
    puts 'Person created successfuly'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title: title, author: author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_num = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_num], @persons[person_num]))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts rental if rental.person.id == id
    end
  end

  def exit
    puts 'Thank you for using the app, see you later!'
    puts
    Kernel.exit
  end
end
