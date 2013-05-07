# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    role "user"
    password "toto"
    
    factory :admin do
      email "admin@example.com"
      role "admin"
    end
  end
end
