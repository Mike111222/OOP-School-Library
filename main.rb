require_relative 'app'
require_relative 'show_menu'
require_relative 'option'

class Main
  include Show
  include Options

  def initialize
    @app = App.new
    puts
    puts 'Welcome To The School Library App!'
  end

  def run_method
    loop do
      show_menu
      user_choice = gets.chomp
      select_option(user_choice)

      method = select_option(user_choice)[user_choice]
      if method.nil?
        puts 'Invalid option, please try again!'
        puts
        show_menu
      else
        @app.send(method)
      end
    end
  end
end

main = Main.new
main.run_method
