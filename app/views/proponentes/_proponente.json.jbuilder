json.extract! proponente, :id, :nome, :cpf, :data_nascimento, :endereco, :numero, :bairro, :cidade, :estado, :cep,
              :telefone, :salario, :created_at, :updated_at
json.url proponente_url(proponente, format: :json)
