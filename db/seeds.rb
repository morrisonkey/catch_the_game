Venue.delete_all
Fan.delete_all
Group.delete_all
Team.delete_all
Broadcast.delete_all
Event.delete_all


##Sportsdatallc.com API CALLS FOR SPORTS INFO.

    mlb = {}

    baseball_teams = HTTParty.get("http://api.sportsdatallc.org/mlb-t4/teams/2014.xml?api_key=tcxmhrf8u2vyk8s5ukxgjrz4")


    baseball_teams = baseball_teams["teams"]["team"]

    mlb = {}

    baseball_teams.each do |team|
      if mlb[team[0]].nil?
        mlb[team[0]]=[]
      end

      mlb[team[0]].push({
        :market             => team["market"],
        :name               => team["name"],
        :league             => team["league"],
        :sports_data_id     => team["id"]
        })
    end
      
    mlb = mlb[nil]
 

#END of sportsDATA API call.

10.times do

  Venue.create({
    name: Faker::Name.first_name + "'s Bar",
    bio: Faker::Company.catch_phrase,
    city: Faker::Address.city,
    phone_number: Faker::Number.number(10)
    })

end

25.times do

  fan = Fan.create({
    bio: Faker::Lorem.paragraph,
    })

end

mlb.each do |team|

  Team.create({
    name: team[:name],
    market: team[:market],
    league: "MLB",
    conference: team[:league],
    sport: "Baseball",
    sports_data_id: team[:sports_data_id]
    })

end

4.times do

  Group.create({
    name: Team.all.sample.name + " Fans " + Faker::Company.suffix,
    bio: Faker::Lorem.paragraph,
    fan_id: Fan.all.sample.id
    })

end


Group.all.each do |group|
    fans = Fan.all.shuffle
    10.times do 
        fan = fans.pop
        Membership.create({
            group_id: group.id,
            fan_id: fan.id
            })
    end
end

20.times do

  broadcast = Broadcast.create({
    name: Team.all.sample.name + " vs " + Team.all.sample.name,
    blurb: Faker::Lorem.sentence
    })

end

10.times do

  event = Event.create({
    name: Broadcast.all.sample.name,
    blurb: Faker::Lorem.sentence,
    info: Faker::Lorem.paragraph,
    venue_id: Venue.all.sample.id,
    broadcast_id: Broadcast.all.sample.id
    })

end