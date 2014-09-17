# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band do
    sequence(:name) { |n| "Band ##{n}" }
  end
end
