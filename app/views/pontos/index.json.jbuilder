json.array!(@pontos) do |ponto|
  json.extract! ponto, :id, :titulo, :data, :staus, :solucao, :questao_id
  json.url ponto_url(ponto, format: :json)
end
