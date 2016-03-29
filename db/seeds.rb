# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |d|
  Developer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.free_email, password: "monkey")
end

10.times do |i|
  Project.create!(name: Faker::App.name, allowed_hours: Faker::Number.between(15, 50))
end

100.times do |i|
  TimeEntry.create!(duration: rand(2..6), date: Faker::Date.backward(14), project_id: rand(1..10), developer_id: rand(1..10))
end
