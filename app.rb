require_relative 'book_methods'
require_relative 'person_methods'
require_relative 'rental_methods'
require_relative 'storage'

class App
  def initialize(options)
    @options = options
    @book_methods = BookMethods.new
    @person_methods = PersonMethods.new
    @rentals_list = RentalMethods.new(@book_methods, @person_methods)
    @book_methods.books_list = Storage.load_data('books')
    @person_methods.people_list = Storage.load_data('Person')
    @rentals_list.rentals_list = Storage.load_data('Rental')
  end

  def select_option(user_choice)
    options = {
      '1' => method(:list_all_books),
      '2' => method(:list_all_people),
      '3' => method(:create_person_and_save),
      '4' => method(:create_book_and_save),
      '5' => method(:create_rental_and_save),
      '6' => method(:list_all_rentals),
      '7' => method(:exit_program)
    }

    selected_option = options[user_choice]

    if selected_option
      selected_option.call
    else
      puts 'Invalid option, please try again!'
    end

    show_menu
  end

  def list_all_books
    @book_methods.list_all_books
  end

  def list_all_people
    @person_methods.list_all_people
  end

  def create_person_and_save
    @person_methods.create_person
    Storage.save_data('Person', @person_methods.people_list)
  end

  def create_book_and_save
    @book_methods.create_book
    Storage.save_data('books', @book_methods.books_list)
  end

  def create_rental_and_save
    @rentals_list.create_rental
    Storage.save_data('Rental', @rentals_list.rentals_list)
  end

  def list_all_rentals
    @rentals_list.list_all_rentals
  end

  def exit_program
    exit
  end

  def show_menu
    @options.show_menu
  end
end
