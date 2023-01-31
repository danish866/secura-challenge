FactoryBot.define do
  factory :order do
    association :merchant
    association :shopper
    completed_at { Time.zone.now }
    amount {Faker::Number.decimal(l_digits: 2)}
  end
end

