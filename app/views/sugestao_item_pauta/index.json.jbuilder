json.array!(@sugestao_item_pauta) do |sugestao_item_pautum|
  json.extract! sugestao_item_pautum, :id, :aprovar, :motivoSugestao, :motivoReprovar, :pessoa_id, :reuniao_id, :questao_id
  json.url sugestao_item_pautum_url(sugestao_item_pautum, format: :json)
end
