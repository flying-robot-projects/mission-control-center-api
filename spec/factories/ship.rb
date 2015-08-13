FactoryGirl.define do

  factory :ship do
    sequence(:name) { |n| "Apollo-#{n}" }
    status "waiting"
    category "rocket"
  end

end