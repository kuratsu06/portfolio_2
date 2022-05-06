FactoryBot.define do
  factory :content do
    user { nil }
    genre { nil }
    category { nil }
    title { "MyString" }
    author { "MyString" }
  end
end
