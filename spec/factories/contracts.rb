FactoryGirl.define do

  factory :contract do
    rental_period [1,3,5,10,15,20,25,30].sample
    discount Faker::Number.normal(5, 2.2)
    delivery_address 'Rua Capote Valente 200'
    contact 'Mestre Juvenal'
    payment_method 'Pools of Cash'
    start_date '20/02/2017'
    customer
  end

end
