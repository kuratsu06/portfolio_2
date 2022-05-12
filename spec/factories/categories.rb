FactoryBot.define do
  factory :category do
    name { "MyString" }
    association :user
    association :genre
  end
end
