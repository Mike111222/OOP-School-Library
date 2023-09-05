module Options
  def select_option(_user_choice)
    {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_all_rentals,
      '7' => :exit
    }
  end
end
