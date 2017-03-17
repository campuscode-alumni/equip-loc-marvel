FactoryGirl.define do

  factory :price do
    rental_period 3
    sequence(:price) { |n| Faker::Number.decimal(2) }
    trait :with_equipment_type do
      equipment_type
    end
  end

end
