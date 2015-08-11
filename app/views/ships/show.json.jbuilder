json.ship do
  json.partial! 'ship', ship: @ship
end

json.ship_model do
  json.partial! 'ship_models/ship_model', ship_model: @ship.ship_model
end