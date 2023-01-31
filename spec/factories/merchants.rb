FactoryBot.define do
    factory :merchant do
        name { Faker::Name.name  }                                                                  
        email { Faker::Internet.email }                                                         
        cif { Faker::Alphanumeric.alpha(number: 10) }  
    end
end