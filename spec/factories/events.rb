# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    sequence(:date) { |n| Date.today.advance(days: n) }
    sequence(:time) { |n| n.days.from_now }
  end
end
