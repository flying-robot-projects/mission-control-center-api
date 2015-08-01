# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

saccoche_model = ShipModel.create(name: "Sacoche", category: "balloon")
saccoche_ship = Ship.create(name: "Sacoche-01", ship_model: saccoche_model, status: "in construction")