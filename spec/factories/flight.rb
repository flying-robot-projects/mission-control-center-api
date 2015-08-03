FactoryGirl.define do

  factory :flight do
    association :ship
    status :pending
    telemetric_recordings nil
  end

end