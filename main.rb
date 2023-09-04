require_relative 'app'

class Options
  def initialize
    @app = App.new(self)

    puts
    puts 'WELCOME TO THE SCHOOL LIBRARY APP!'
    show_menu
  end

  def show_menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 -  List all books'
    puts '2 -  List all people'
    puts '3 -  Create a person'
    puts '4 -  Create a book'
    puts '5 -  Create a rental'
    puts '6 -  List all rentals for a given person id'
    puts '7 -  Exit'
    puts
    user_choice = gets.chomp
    @app.select_option(user_choice)
  end
end

def main
  Options.new
end

main
