100.times do
  proponente = FactoryBot.create(:proponente)
  FactoryBot.create(:contato, proponente:)
  FactoryBot.create(:endereco, proponente:)
end
