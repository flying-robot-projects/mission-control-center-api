FactoryGirl.define do

  factory :ship do
    sequence(:name) { |n| "Apollo-#{n}" }
    association :ship_model
    status "ready"
  end

end