# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teams = Team.create([
	{ name: "SpeedWalkers", steps: 2700},
	{ name: "RoadRunners", steps: 2354}, 
	{ name: "Eat Pavement", steps: 4330}, 
	{ name: "Speed Racer", steps: 3740},
	{ name: "Fred's Team", steps: 4000}, 
	{ name: "Dont Run!", steps: 3500}
])