FactoryBot.define do
  factory :taxi do
    departure           {"天王寺"}
    arrival               {"難波"}
    title              {"安かった"}
    text  {"よく道を知ってる人だった"}
    association :user
  end
end