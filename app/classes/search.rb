class Search

  attr_accessor :results

  def initialize
    @results = []
  end

  def team_search(keyword)
   Team.where(name: keyword).each do |team|  
     @results << team
   end
   Team.where(market: keyword).each do |team|    
     @results << team
   end
   return @results
 end
end