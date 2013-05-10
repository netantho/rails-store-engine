# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    status "pending"
    total_price 1.5
    date_shipment "2013-05-09 14:22:41"
    
    after(:build) do |order|
      order.sales << FactoryGirl.build(:sale)
      order.user = FactoryGirl.build(:user)
    end

    factory :order_cancelled do
      status "cancelled"
    end

    factory :order_paid do
      status "paid"
    end

    factory :order_shipped do
      status "shipped"
    end

    factory :order_returned do
      status "returned"
    end
  end
end
