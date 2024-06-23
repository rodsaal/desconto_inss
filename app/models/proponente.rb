class Proponente < ApplicationRecord
  has_one :contato, dependent: :destroy
  has_one :endereco, dependent: :destroy

  accepts_nested_attributes_for :contato, allow_destroy: true
  accepts_nested_attributes_for :endereco, allow_destroy: true

  validates :nome, :cpf, :data_nascimento, :salario, presence: true
  validates :cpf, uniqueness: true
end
