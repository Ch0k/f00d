FactoryBot.define do
  factory :product do
    title { "MyString" }
    body { "MyText" }
    price { 1 }

    trait :invalid do
      title { nil }
    end
  end
end
