FactoryGirl.define do

  factory :mission do
    ship
    status "pending"
    telemetric_recordings nil
  end

end