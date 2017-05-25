5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  confirmed_at: Time.now
end
users = User.all

5.times do
  Item.create!(
    user: users.sample,
    name: Faker::Name.name,
  )
end
items = Item.all

puts "#{User.count} users created"
puts "#{Item.count} wikis created"
puts "Seed finished"
puts "Some seeds fell beside the road, and the birds came and ate them up..."
