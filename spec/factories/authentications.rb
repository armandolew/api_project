FactoryBot.define do
  factory :authentication do
    user { create(:user) }
    token { Faker::Internet.uuid }
    active { true }
  end
end
