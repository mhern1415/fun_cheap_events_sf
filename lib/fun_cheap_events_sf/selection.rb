class FunCheapEventsSf::Selection
  @@all = []
  attr_accessor :name, :ref, :details, :cost
  
  def initialize(name, ref)
    @name = name 
    @ref = ref 
    @details = []
    @cost = []
    @@all << self 
  end
  
  def self.all
    FunCheapEventsSf::Webscraper.scrape_selections if @@all.empty?
    @@all
  end
  
  def get_details
    FunCheapEventsSf::Webscraper.scrape_details(self) if @details.empty?
    @details
  end
  
end
