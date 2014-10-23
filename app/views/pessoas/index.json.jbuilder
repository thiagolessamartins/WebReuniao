json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome, :cpf, :uf, :cidade, :endereco, :email, :matricula
  json.url pessoa_url(pessoa, format: :json)
end
