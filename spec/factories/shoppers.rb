FactoryBot.define do
  factory :shopper do
      name { Faker::Name.name  }                                                                  
      email { Faker::Internet.email }                                                         
      nif { Faker::Alphanumeric.alpha(number: 10) }  
  end
end