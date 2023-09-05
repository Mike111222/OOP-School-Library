require './student'
require './teacher'
require './book'
require './rental'
require_relative 'data_manager/save_data'

class App
  def initialize(parent)
    @parent = parent
    @books_list = []
    @people_list = []
    @rentals_list = []
  end

  def list_all_books
    if @books_list.empty?
      puts 'No record found! Add some books...'
    else
      puts 'Available books in the library'
      @books_list.each { |book| puts book }
    end
  end

  def list_all_people
    if @people_list.empty?
      puts 'No record found! Add a person...'
    else
      puts 'All people in the library'
      @people_list.each do |person|
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
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    @people_list.push(Student.new(age, name, parent_permission: parent_permission))
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
    @people_list.push(Teacher.new(age, specialization, name))
    puts
    puts 'Person created successfuly'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books_list.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books_list.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_num = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, @books_list[book_num], @people_list[person_num]))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals_list.each do |rental|
      puts rental if rental.person.id == id
    end
  end

  def save_datas
    puts 'Saving data to JSON files...'
    SaveData.save_data_to_json('data/books.json', @books_list)
    SaveData.save_data_to_json('data/people.json', @people_list)
    SaveData.save_data_to_json('data/rentals.json', @rentals_list)
    puts 'Data saved successfully!'
  end

  def exit
    save_datas
    puts 'Thank you for using the app, see you later!'
    puts
    Kernel.exit
  end
end
