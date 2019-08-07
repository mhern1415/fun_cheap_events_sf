class FunCheapEventsSf::CLI 
    @@red="\e[1;31m"

  def start
    puts "\n#{@@red}
------------------------Welcome to Fun Cheap Events SF------------------------           

This application will guide you in selecting an event that will occur today.    Once selected, more details can  be seen about the event as well as the cost of the event if available.

Below,you will find a list of events. Please select an event too see more       details.
\n"
    @input = ""
    until @input == "done"
    get_selections
    list_selections
    get_user_selection
    done
  
  end
  goodbye
  end
  
  def get_selections
    
  end
  
  def list_selections
    
  end
    
  def get_user_selection
    
  end 

  def valid_input(input, data)
    
  end 
  
  def show_events_det(chosen_selection)
   
  end

  def done
    puts "\nIf you would like to see more events, press any key. If you are done, please type 'done' to exit.\n"
    @input = gets.strip
  end 
  
  def goodbye
    puts "\nThank you for using FunCheapBayArea! Goodbye!\n"
  end
end