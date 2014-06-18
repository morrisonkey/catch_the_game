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
        name: Faker.Name.name 
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

baseball_team_logos = {
    "Angels" => "http://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Los_Angeles_Angels_of_Anaheim.svg/187px-Los_Angeles_Angels_of_Anaheim.svg.png", "Astros" => "http://upload.wikimedia.org/wikipedia/en/thumb/0/05/Houston_Astros_Logo.svg/216px-Houston_Astros_Logo.svg.png", "Athletics" => "http://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Oakland_athl_primlogo.svg/250px-Oakland_athl_primlogo.svg.png", "Blue Jays" => "http://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Toronto_Blue_Jays.svg/250px-Toronto_Blue_Jays.svg.png", "Braves" => "http://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Atlanta_Braves.svg/250px-Atlanta_Braves.svg.png", "Brewers" => "http://upload.wikimedia.org/wikipedia/en/thumb/1/11/Milwaukee_Brewers_Logo.svg/176px-Milwaukee_Brewers_Logo.svg.png", "Cardinals" => "http://upload.wikimedia.org/wikipedia/en/thumb/e/e6/St._Louis_Cardinals_Logo.svg/216px-St._Louis_Cardinals_Logo.svg.png", "Cubs" => "http://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Chicago_Cubs_Logo.svg/216px-Chicago_Cubs_Logo.svg.png", "Diamondbacks" => "http://upload.wikimedia.org/wikipedia/de/thumb/9/9d/Arizona_Diamondbacks_Logo.svg/201px-Arizona_Diamondbacks_Logo.svg.png", "Dodgers" => "http://upload.wikimedia.org/wikipedia/en/2/20/Los_Angeles_Dodgers_Logo.png", "Giants" => "http://upload.wikimedia.org/wikipedia/en/thumb/5/58/San_Francisco_Giants_Logo.svg/216px-San_Francisco_Giants_Logo.svg.png", "Indians" => "http://upload.wikimedia.org/wikipedia/en/thumb/5/52/Cleveland_Indians_logo.svg/200px-Cleveland_Indians_logo.svg.png", "Mariners" => "http://upload.wikimedia.org/wikipedia/en/thumb/b/b0/Seattle_Mariners_logo.svg/202px-Seattle_Mariners_logo.svg.png", "Marlins" => "http://upload.wikimedia.org/wikipedia/en/thumb/b/b4/MiamiMarlins.svg/201px-MiamiMarlins.svg.png", "Mets" => "http://upload.wikimedia.org/wikipedia/en/thumb/7/7b/New_York_Mets.svg/250px-New_York_Mets.svg.png", "Nationals" => "http://upload.wikimedia.org/wikipedia/de/thumb/7/7f/Washington-Nationals-Logo.svg/250px-Washington-Nationals-Logo.svg.png", "Orioles" => "http://upload.wikimedia.org/wikipedia/de/thumb/archive/e/e2/20131028133853%21Baltimore_Orioles_Logo.svg/400px-Baltimore_Orioles_Logo.svg.png", "Padres" => "http://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/San_Diego_Padres_logo.svg/480px-San_Diego_Padres_logo.svg.png", "Phillies" => "http://upload.wikimedia.org/wikipedia/en/thumb/8/84/Philadelphia_Phillies.svg/250px-Philadelphia_Phillies.svg.png", "Pirates" => "http://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Pittsburgh_Pirates_MLB_Logo.svg/216px-Pittsburgh_Pirates_MLB_Logo.svg.png", "Rangers" => "http://upload.wikimedia.org/wikipedia/en/thumb/4/41/Texas_Rangers.svg/250px-Texas_Rangers.svg.png", "Rays" => "http://upload.wikimedia.org/wikipedia/en/thumb/c/c6/Tampa_Bay_Rays.svg/250px-Tampa_Bay_Rays.svg.png", "Red Sox" => "http://upload.wikimedia.org/wikipedia/en/thumb/6/6d/RedSoxPrimary_HangingSocks.svg/359px-RedSoxPrimary_HangingSocks.svg.png", "Reds" => "http://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Cincinnati_Reds_Logo.svg/216px-Cincinnati_Reds_Logo.svg.png", "Rockies" => "http://upload.wikimedia.org/wikipedia/en/thumb/3/31/Colorado_Rockies_logo.svg/234px-Colorado_Rockies_logo.svg.png", "Royals" => "http://upload.wikimedia.org/wikipedia/en/thumb/1/1c/Kansas_City_Royals.svg/250px-Kansas_City_Royals.svg.png", "Tigers" => "http://www.clipartbest.com/cliparts/9T4/eEk/9T4eEkbrc.png", "Twins" => "http://upload.wikimedia.org/wikipedia/de/thumb/e/e3/Minnesota_Twins_Logo.svg/400px-Minnesota_Twins_Logo.svg.png", "White Sox" => "http://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Chicago_White_Sox.svg/181px-Chicago_White_Sox.svg.png", "Yankees" => "http://upload.wikimedia.org/wikipedia/en/thumb/2/25/NewYorkYankees_PrimaryLogo.svg/300px-NewYorkYankees_PrimaryLogo.svg.png"
}

mlb.each do |team|

    Team.create({
        name: team[:name],
        market: team[:market],
        league: "MLB",
        conference: team[:league],
        sport: "Baseball",
        sports_data_id: team[:sports_data_id],
        photo_url: baseball_team_logos[team[:name]]
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