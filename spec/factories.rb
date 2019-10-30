FactoryBot.define do
    factory :user do
      sequence :email do |n|
         "dummyEmail#{n}@gmail.com" 
      end
      sequence :username do |n|
        "Pint_o'_Guiness"
      end
      password { "secretPassword" }
      password_confirmation { "secretPassword" }
    end
  end