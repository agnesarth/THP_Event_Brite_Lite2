require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

2.times do 
  @user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.sentence,  
    email: Faker::Internet.email(domain: 'yopmail.com'),
    password: "bonjour"
    )
end
puts "Tes users sont dans la place"

2.times do
  @event = Event.create(
    start_date: Faker::Time.forward(days: 360),
    duration: [15, 30, 45, 60, 90, 120, 150].sample,
    title: Faker::Book.title,
    description: Faker::Hacker.say_something_smart,
    price: rand(1..1000),
    location: Faker::Address.city,
    admin: User.all.sample
  )
end
puts "Tes events sont créés"


1.times do
  @attendance = Attendance.create(
    stripe_customer_id: "bonjourbisous",
    guest: User.all.sample,
    event: Event.all.sample
  )
end

puts "C'est bon pour les participations"