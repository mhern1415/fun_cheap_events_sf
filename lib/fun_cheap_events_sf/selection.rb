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
    
  end
  
  def get_details
   
  end
  
end