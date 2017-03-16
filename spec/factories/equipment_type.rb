FactoryGirl.define do

  factory :equipment_type do
    sequence(:name) { |n| "#{n}000W" }
    trait :with_price do
      price
    end
  end

end
