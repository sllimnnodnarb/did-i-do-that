5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  user.update_attributes!(confirmed_at: Time.now)
end
users = User.all

20.times do
  item = Item.create!(
    user: users.sample,
    name: Faker::ChuckNorris.fact,
  )
  item.update_attributes!(created_at: 10.days.ago)
end
items = Item.all

puts "#{User.count} users created"
puts "#{Item.count} items created"
puts "Seed finished"
puts "Some seeds fell beside the road, and the birds came and ate them up..."
