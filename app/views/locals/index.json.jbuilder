json.array!(@locals) do |local|
  json.extract! local, :id, :uf, :cidade, :endereco, :complemento, :status
  json.url local_url(local, format: :json)
end
