require 'rails_helper'

RSpec.describe Proponente, type: :model do
  # Teste de criação de um novo proponente
  describe 'creation' do
    it 'is valid with valid attributes' do
      proponente = Proponente.new(nome: 'John Doe', cpf: '123.456.789-00', data_nascimento: '1980-01-01', salario: 3000.00)
      expect(proponente).to be_valid
    end
  end

  # Testes de validações
  describe 'validations' do
    it 'is not valid without a nome' do
      proponente = Proponente.new(nome: nil)
      expect(proponente).not_to be_valid
    end

    it 'is not valid without a cpf' do
      proponente = Proponente.new(cpf: nil)
      expect(proponente).not_to be_valid
    end
  end

  # Teste do método de cálculo do desconto do INSS
  describe '#calcular_desconto_inss' do
    it 'calculates the correct INSS discount' do
      proponente = Proponente.new(nome: 'John Doe', cpf: '123.456.789-00', data_nascimento: '1980-01-01', salario: 3000.00)
      proponente.save
      expect(proponente.desconto_inss).to eq(254.33)
    end
  end
end
