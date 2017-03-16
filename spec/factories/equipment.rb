FactoryGirl.define do

  factory :equipment do
    sequence(:name) { |n| Faker::Name.first_name }
    description 'Furadeira Bonita'
    sequence(:serial_number) { |n| Faker::Number.number(6) }
    sequence(:acquisition_value) { |n| Faker::Number.decimal(2) }
    acquisition_date Faker::Date.between(2.years.ago, 1.month.ago)
    shelf_life '5 anos'
    picture 'img/furadeira'
    manufacture 'bosch'
    vendor 'Zezinho'
    trait :with_equipment_type_and_price do
      equipment_type { create(:equipment_type, :with_price)}
    end
  end

end
