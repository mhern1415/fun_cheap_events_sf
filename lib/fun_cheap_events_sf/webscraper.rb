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
    
    info = page.css("div p") 
    
    info.each do |i|
      info = i.text.strip.chomp
      info.delete_suffix!('Facebook comments:') 
      selection.details << info
    end 
    info = page.css("span.cost")
    info.each do |i|
      info = i.text.strip.chomp 
      info.delete_prefix!('| Cost:')
       info.delete_suffix!('*')
      selection.cost << info
    end
  end
end
