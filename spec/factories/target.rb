FactoryGirl.define do

  sequence(:name) { |n| "heroku-app-#{n}" }

  factory :target do
    name
  end

end
