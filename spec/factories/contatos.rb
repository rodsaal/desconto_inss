FactoryBot.define do
  factory :contato do
    email { Faker::Internet.email }
    telefone { Faker::PhoneNumber.phone_number }
    proponente
  end
end
