FactoryGirl.define do

  factory :telemetric_recording do
    flight_id 1
    data '{ "altitude": "254", "temperature_1": "25", "temperature_2": "33" }'
  end

end