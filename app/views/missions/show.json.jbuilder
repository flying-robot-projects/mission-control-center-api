json.mission do
  json.partial! 'mission', mission: @mission
end

json.ship do
  json.partial! 'ships/ship', ship: @mission.ship
end