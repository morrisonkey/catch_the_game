Venue.delete_all
Fan.delete_all
Group.delete_all
Team.delete_all
Broadcast.delete_all
Event.delete_all

10.times do

  venue = Venue.create({
    name: Faker::Name.first_name + "'s Bar",
    bio: Faker::Company.catch_phrase,
    city: Faker::Address.city,
    phone_number: Faker::Number.number(10)
    })

end

25.times do

  fan = Fan.create({
    username: Faker::Internet.user_name,
    email: Faker::Internet.free_email
    })

end

25.times do

  team = Team.create({
    name: Faker::Commerce.color.capitalize + " " + Faker::Commerce.product_name,
    location: Faker::Address.city,
    league: "MLB",
    sport: "Baseball"
    })

end

12.times do

  group = Group.create({
    name: Team.all.sample.name + " Fans " + Faker::Company.suffix,
    creator_id: Fan.all.sample.id,
    bio: Faker::Lorem.paragraph,
    fan_id: 
    })

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