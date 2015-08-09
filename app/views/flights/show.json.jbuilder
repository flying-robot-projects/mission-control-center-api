json.flight do
  json.partial! 'flight', flight: @flight
end

json.ship do
  json.partial! 'ships/ship', ship: @flight.ship
end