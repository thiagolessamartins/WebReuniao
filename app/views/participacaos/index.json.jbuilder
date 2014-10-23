json.array!(@participacaos) do |participacao|
  json.extract! participacao, :id, :contribuicao, :pessoa_id, :reuniao_id
  json.url participacao_url(participacao, format: :json)
end
