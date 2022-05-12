FactoryBot.define do
  factory :post do
    subtitle { "MyString" }
    diary { "MyText" }
    association :user
    association :category
    association :content
  end
end
