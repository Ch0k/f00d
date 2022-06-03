FactoryBot.define do
  factory :order do
    address { "MyString" }
    
    trait :invalid do
      title { nil }
    end
  end
end
