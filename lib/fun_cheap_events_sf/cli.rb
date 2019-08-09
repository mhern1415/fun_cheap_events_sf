class FunCheapEventsSf::CLI 
      @@red="\e[1;31m"
      @@white="\e[0;37m"
      @@yellow="\e[0;33m"
      @@blue="\e[0;34m"
      @@green="\e[0;32m"
  def start
    puts "\n#{@@white}
------------------------#{@@red}Welcome to Fun Cheap Events SF#{@@white}------------------------           

#{@@yellow}This application will guide you in selecting an event that will occur today.    Once selected, more details can  be seen about the event as well as the cost of the event if available.

Feel free to check out more than one event and if you're feeling adventurous,   out all of them!#{@@white}
\n"
    @input = ""
    until @input == "n"
    get_selections
    list_selections
    get_user_selection
    done
  
    end
    goodbye
  end
  
  def get_selections
    @selections = FunCheapEventsSf::Selection.all
  end
  
  def list_selections
    puts "\nFrom the list below, please select an #{@@green}event#{@@white} to get the event information.
    \n"
    @selections.each.with_index(1) do |selection, index| 
      puts "#{@@blue}#{index}#{@@white}. #{@@green}#{selection.name}#{@@white}"
    end
  end
    
  def get_user_selection
    chosen_selection = gets.strip.to_i
    show_events_det(chosen_selection) if valid_input(chosen_selection, @selections)
  end 

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def show_events_det(chosen_selection)
    selection = @selections [chosen_selection - 1]
    selection.get_details
    puts "\n#{@@blue}Details:#{@@white}#{selection.name}.\n"
    puts selection.details
    puts "#{selection.name}" unless selection.cost.empty? 
    puts selection.cost
  end

  def done
    puts "\nWould you like to see more events?#{@@red}(y/n)#{@@white}\n"
    @input = gets.strip
  end 
  
  def goodbye
    puts "\nThank you for using FunCheapEventsSf! Goodbye!\n"
  end
end
