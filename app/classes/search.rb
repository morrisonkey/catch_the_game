class Search

  attr_accessor :results

  def initialize
    @results = []
  end

  def team_search(keyword)
    search_term = keyword.downcase.titleize
    Team.where(name: search_term).each do |team|  
     @results << team
   end
   if keyword != ""
     Team.where(market: search_term).each do |team|    
       @results << team
     end
   end
   return @results
 end
end