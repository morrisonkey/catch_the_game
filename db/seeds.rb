Venue.delete_all
Fan.delete_all
Group.delete_all
Team.delete_all
Broadcast.delete_all
Event.delete_all
User.delete_all


#Sportsdatallc.com API CALLS FOR Team INFO.

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

#Scheduling API call
game_schedule = {}

#this binding.pry is intended to split up the API calls
binding.pry
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
#END of call



i = 0
25.times do
    i += 1
    User.create({
        email: "test_email#{i}@gmail.com",
        password: "password123"
        })
end

10.times do

random_bar_photo = ["http://www.thealbanybowl.com/files/bar4.jpg", "http://1.bp.blogspot.com/_m5WRB8ziRT0/TBY_wUlfEGI/AAAAAAAAATs/xNbJ8Hh867A/s1600/IMG_4152.JPG", "http://rmrequipmentrental.com/sattleraudiovideo/images/Album/Sports%20Bars/slides/Sports%20Bar%20Lights%20Pic.jpg"]
  Venue.create({
    name: Faker::Name.first_name + "'s Bar",
    bio: Faker::Company.catch_phrase,
    city: Faker::Address.city,
    phone_number: Faker::Number.number(10),
    photo_url: random_bar_photo.sample,
    user_id: User.all.sample.id
    })

end


mlb.each do |team|

random_logos = ["http://content.sportslogos.net/logos/54/74/full/i8axc5r73mlh7xsg4g50i8e4p.gif", "http://walls-world.com/wp-content/uploads/2013/09/Logo-Chicago-White-Sox-Wallpaper.jpg", "http://www.sports-logos-screensavers.com/user/TampaBayDevilRays5.jpg", "http://content.sportslogos.net/logos/53/68/full/1262.gif"]
  Team.create({
    name: team[:name],
    market: team[:market],
    league: "MLB",
    conference: team[:league],
    sport: "Baseball",
    sports_data_id: team[:sports_data_id],
    photo_url: random_logos.sample
    })

end

4.times do

  Group.create({
    name: Team.all.sample.name + " Fans " + Faker::Company.suffix,
    bio: Faker::Lorem.paragraph,
    user_id: User.all.sample.id
    })

end


Group.all.each do |group|
    users = User.all.shuffle
    10.times do 
        user = users.pop
        Membership.create({
            group_id: group.id,
            user_id: user.id
            })
    end
end

game_schedule.each do |broadcast|

    Broadcast.create({
        visitor: broadcast[:visitor],
        home: broadcast[:home],
        datetime: broadcast[:scheduled_start]
    })

end

10.times do

  event = Event.create({
    name: Broadcast.all.sample.visitor_team.name + " vs. " + Broadcast.all.sample.home_team.name,
    blurb: Faker::Lorem.sentence,
    info: Faker::Lorem.paragraph,
    venue_id: Venue.all.sample.id,
    broadcast_id: Broadcast.all.sample.id
    })

end

5.times do 
    todays_broadcast = Broadcast.todays_broadcasts.sample
    Event.create({
        broadcast_id: todays_broadcast.id,
        venue_id: Venue.all.sample.id,
        name: todays_broadcast.title,
        blurb: Faker::Lorem.sentence,
        info: Faker::Lorem.paragraph
        })
end