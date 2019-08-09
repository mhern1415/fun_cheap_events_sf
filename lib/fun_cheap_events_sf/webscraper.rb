class FunCheapEventsSf::Webscraper 
  def self.scrape_selections 
    page = Nokogiri::HTML(open("https://sf.funcheap.com/today/"))

    selections = page.css("span.title a") 

    selections.each do |s|
      name = s.text.strip.chomp
      ref = s.attr("href")
      FunCheapEventsSf::Selection.new(name, ref)
    end 
    
    #page2 = Nokogiri::HTML(open("https://sf.funcheap.com/today/page/2/"))
    
    #selections = page2.css("span.title a")
    
    #selections.each do |s|
    #  name = s.text.strip.chomp
    #  ref = s.attr("href")
     # FunCheapEventsSf::Selection.new(name, ref)
    #end     
    
    #page3 = Nokogiri::HTML(open("https://sf.funcheap.com/today/page/3/"))
    
    #selections = page3.css("span.title a")
    
    #selections.each do |s|
    #  name = s.text.strip.chomp
     # ref = s.attr("href")
     # FunCheapEventsSf::Selection.new(name, ref)
    #end      


  end
  
  
  def self.scrape_details(selection)
   
    url = "#{selection.ref}"
    page = Nokogiri::HTML(open(url)) 
    
    event_details = page.css("div p") 
    
    event_details.each do |i|
      event_details = i.text.strip.chomp
      event_details.delete_suffix!('Facebook comments:') 
      selection.details << event_details
    end 
    
    event_cost = page.css("span.cost")
    
    event_cost.each do |i|
      event_cost = i.text.strip.chomp 
      event_cost.delete_prefix!('| Cost:')
      event_cost.delete_suffix!('*')
      selection.cost << event_cost
    end
  end
end
