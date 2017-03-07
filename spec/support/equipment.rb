FactoryGirl.define do

  factory :equipment_type do
    sequence(:name) { |n| "#{n}000W" }
    after(:create) { |equipment_type| create(:price, equipment_type_id: equipment_type.id) }
  end

  factory :price do
    rental_period '1'
    sequence(:price) { |n| Faker::Number.decimal(2) }
  end

  factory :equipment do
    sequence(:name) { |n| Faker::Lorem.word }
    description 'Furadeira Bonita'
    sequence(:serial_number) { |n| Faker::Number.number(6) }
    sequence(:acquisition_value) { |n| Faker::Number.decimal(2) }
    acquisition_date Faker::Date.between(2.years.ago, 1.month.ago)
    shelf_life '5 anos'
    picture 'img/furadeira'
    manufacture 'bosch'
    vendor 'Zezinho'
  end

end
