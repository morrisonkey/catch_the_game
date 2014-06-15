module ApplicationHelper

	def from_UTC_to_EST(utc)
		utc - 4.hour
	end

end
