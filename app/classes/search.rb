class Search

  attr_accessor :results

  def initialize
    @results = []
  end

  def team_search(keyword)
    search_term = keyword.titleize
   Team.where(name: search_term).each do |team|  
     @results << team
   end
   Team.where(market: search_term).each do |team|    
     @results << team
   end
   return @results
 end
end