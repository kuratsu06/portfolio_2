FactoryBot.define do
  factory :content do
    title { "MyString" }
    author { "MyString" }
    association :user
    association :genre
    association :category
  end
end
