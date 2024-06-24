class Proponente < ApplicationRecord
  has_one :contato, dependent: :destroy
  has_one :endereco, dependent: :destroy

  accepts_nested_attributes_for :contato, allow_destroy: true
  accepts_nested_attributes_for :endereco, allow_destroy: true

  validates :nome, :cpf, :data_nascimento, :salario, presence: true
  validates :cpf, uniqueness: true

  before_save :calcular_e_salvar_inss

  private

  def calcular_e_salvar_inss
    self.desconto_inss = self.class.calcular_desconto_inss(salario)
  end

  # Método de classe para calcular o INSS
  def self.calcular_desconto_inss(salario)
    faixas = [
      { limite: 1045.00, aliquota: 0.075 },
      { limite: 2089.60, aliquota: 0.09 },
      { limite: 3134.40, aliquota: 0.12 },
      { limite: 6101.06, aliquota: 0.14 }
    ]

    desconto_total = 0
    salario_restante = salario

    faixas.each do |faixa|
      if salario_restante > faixa[:limite]
        desconto = (faixa[:limite] - (faixas.index(faixa) > 0 ? faixas[faixas.index(faixa) - 1][:limite] : 0)) * faixa[:aliquota]
        desconto_total += desconto
        salario_restante -= faixa[:limite]
      else
        desconto = salario_restante * faixa[:aliquota]
        desconto_total += desconto
        break
      end
    end

    desconto_total
  end
end
