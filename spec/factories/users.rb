FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end
  factory :user do
    email
    last_name { '12345678' }
    first_name { '12345678' }
    phone { '12345678' }
    password { '12345678' }
    password_confirmation { '12345678' }
    #confirmed_at { Time.now }
    
    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
        
    factory :manager do
      after(:create) {|user| user.add_role(:manager)}
    end

    factory :customer do
      after(:create) {|user| user.add_role(:customer)}
    end
  end
end
