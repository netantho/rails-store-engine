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

    factory :product_unvisible do
      title 'Unvisible Chair'
      visible false
    end

    factory :product_with_category do
      title 'Gift'
      description 'Surprise!'
      price 10.5
      after(:build) do |product|
        product.categories << FactoryGirl.build(:category)
      end
    end
  end
end
