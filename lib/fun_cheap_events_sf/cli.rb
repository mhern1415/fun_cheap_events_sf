class FunCheapEventsSf::CLI 
      @@red="\e[1;31m"
      @@white="\e[0;37m"
      @@yellow="\e[0;33m"
      @@blue="\e[0;34m"
      @@green="\e[0;32m"
  def start
    puts "\n#{@@white}
------------------------#{@@red}Welcome to Fun Cheap Events SF#{@@white}------------------------           

#{@@yellow}This application will assist you in finding an event that will occur today in  the San Francisco Bay Area.

Once selected, more details can  be seen about the event as well as the cost of the event if available.

Feel free to check out more than one event and if you're feeling adventurous,   check out all of them!#{@@white}
\n"
    @input = ""
  until @input == "n"
  event_selections
  more_or_exit
  
  end
  user_exit
  end
  
  def event_selections
    @selections = FunCheapEventsSf::Selection.all
    show_selections
    user_selection
  end
  
  def show_selections
    puts "\nFrom the list below, please select an #{@@green}event#{@@white} to get the event information.
    \n"
    @selections.each.with_index(1) do |selection, index| 
      puts "#{@@blue}#{index}#{@@white}. #{@@green}#{selection.name}#{@@white}"
    end
  end
    
  def user_selection
    chosen_selection = gets.strip.to_i
    show_event_det(chosen_selection) if is_input_valid(chosen_selection, @selections)
  end 

  def is_input_valid(user_input, data)
    user_input.to_i <= data.length && user_input.to_i > 0
  end 
  
  def show_event_det(chosen_selection)
    selection = @selections [chosen_selection - 1]
    selection.get_details
    puts "\n#{@@blue}Details:#{@@white}#{selection.name}.\n"
    puts selection.details unless selection.details.empty?
    puts selection.cost unless selection.cost.empty?
  end

  def more_or_exit
    puts "\nWould you like to see more events? Type any key to continue or #{@@red}n#{@@white} if you would   like to quit.\n"
    @input = gets.strip
  end 
  
  def user_exit
    puts "\nThank you for using #{@@red}FunCheapEventsSf#{@@white}! Have a great day!\n"
  end
end
