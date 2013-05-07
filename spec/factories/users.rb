# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    role "user"
    password "toto"
    full_name "User"
    
    factory :admin do
      email "admin@example.com"
      role "admin"
      full_name "Admin"
    end
  end
end
