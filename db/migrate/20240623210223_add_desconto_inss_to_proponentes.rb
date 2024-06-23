class AddDescontoInssToProponentes < ActiveRecord::Migration[7.1]
  def change
    add_column :proponentes, :desconto_inss, :decimal, scale: 2, precision: 10
  end
end
