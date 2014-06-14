class Broadcast < ActiveRecord::Base
  has_many :likes, as: :likeable
  has_many :venues, through: :events
  has_many :events
  has_many :comments, as: :commentable


	def self.api_call 
	  	baseball = HTTParty.get("http://api.sportsdatallc.org/mlb-t4/schedule/2014.xml?api_key=tcxmhrf8u2vyk8s5ukxgjrz4")

		schedule = baseball["calendars"]["event"]

		schedule.each do |vs|
		  	if game_schedule[vs[0]].nil?
		    	game_schedule[vs[0]]=[]
			end

			game_schedule[vs[0]].push({
			    :scheduled_start => vs["scheduled_start"],
			    :visitor         => vs["visitor"],
			    :home            => vs["home"]
			    })
		end
		  
		game_schedule = game_schedule[nil]
		return game_schedule
	end

end
