FactoryGirl.define do

  factory :ship do
    sequence(:name) { |n| "Ship-#{n}" }
    association :ship_model
    status "ready"
  end

end