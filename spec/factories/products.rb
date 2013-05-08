FactoryGirl.define do
  factory :product do
    title 'Chair'
    description 'Four chair legs'
    price 50.5
    visible true

    factory :table do
      title 'Table'
      description 'Simple table'
      price 100
    end

    factory :product_not_visible do
      visible false
    end
  end
end