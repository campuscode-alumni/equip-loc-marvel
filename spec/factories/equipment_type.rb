FactoryGirl.define do

  factory :equipment_type do
    sequence(:name) { |n| "#{n}000W" }
  end

end
