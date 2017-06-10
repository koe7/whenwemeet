# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ email: 'jack@mail', password: 'software', name: 'jack' }, { email: 'jill@mail', password: 'development', name: 'jill' }])

group_first = Group.create(name: 'jack&jill')

GroupJoin.create(user_id: users.first.id, group_id: group_first.id, status: 0)
GroupJoin.create(user_id: users.second.id, group_id: group_first.id, status: 0)

schedules_of_jack = Timetable.create([{ user_id: users.first.id, begins: 3, ends: 6 }, { user_id: users.first.id, begins: 30, ends: 35 }])
schedules_of_jill = Timetable.create([{ user_id: users.second.id, begins: 7, ends: 10 }, { user_id: users.second.id, begins: 32, ends: 38 }])
