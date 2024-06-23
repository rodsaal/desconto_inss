FactoryBot.define do
  factory :proponente do
    nome { Faker::Name.name }
    cpf { Faker::IdNumber.brazilian_citizen_number(formatted: true) }
    data_nascimento { Faker::Date.birthday(min_age: 18, max_age: 65) }
    salario { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
  end
end
