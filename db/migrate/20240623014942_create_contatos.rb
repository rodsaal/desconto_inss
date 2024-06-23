class CreateContatos < ActiveRecord::Migration[7.1]
  def change
    create_table :contatos do |t|
      t.string :email
      t.string :telefone
      t.references :proponente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
