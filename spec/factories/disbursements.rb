FactoryBot.define do
  factory :disbursement do
      association :merchant                                                                 
      week_start { Time.zone.now.beginning_of_week }                                                         
      week_end { Time.zone.now.end_of_week }
      amount {Faker::Number.decimal(l_digits: 2)}
  end
end