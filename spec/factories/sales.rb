# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale do
    quantity 1
    price 1.5
    
    after(:build) do |sale|
      sale.product = FactoryGirl.build(:product)
    end
  end
end
