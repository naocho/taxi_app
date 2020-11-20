FactoryBot.define do
  factory :taxi do
    departure             {"https://businesspress.jp/theme/document/#static-page"}
    arrival               {"一言コメント"}
    title                 {"タイトル"}
    text                  {"詳細"}
    association :user
  end
end