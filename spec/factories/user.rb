FactoryBot.define do
  factory :user do
    nickname              {"abemaru"}
    email                 {"sample831@gmail.com"}
    password              {"sample0831"}
    password_confirmation {password}
  end
end