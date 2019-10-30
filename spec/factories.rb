FactoryBot.define do
  factory :beer do
    
  end

  factory :comment do
    
  end

  factory :post do
    
  end

    factory :user do
      sequence :email do |n|
        "dummyEmail#{n}@gmail.com" 
      end
      password { "secretPassword" }
      password_confirmation { "secretPassword" }
    end
  end