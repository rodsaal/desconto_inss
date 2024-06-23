100.times do
  proponente = FactoryBot.create(:proponente)
  FactoryBot.create(:contato, proponente: proponente)
  FactoryBot.create(:endereco, proponente: proponente)
end