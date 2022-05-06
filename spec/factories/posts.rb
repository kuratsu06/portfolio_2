FactoryBot.define do
  factory :post do
    user { nil }
    genre { nil }
    category { nil }
    content { nil }
    subtitle { "MyString" }
    diary { "MyText" }
  end
end
