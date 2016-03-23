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
  Project.create!(name: Faker::App.name, allowed_hours: Faker::Number.between(1, 10))
end

10.times do |i|
  TimeEntry.create!(duration: rand(2..20), date: Faker::Date.backward(2), project_id: i += 1, developer_id: i += 0)
end
