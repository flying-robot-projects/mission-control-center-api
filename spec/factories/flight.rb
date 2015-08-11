FactoryGirl.define do

  factory :flight do
    ship
    status "pending"
    telemetric_recordings nil
  end

end