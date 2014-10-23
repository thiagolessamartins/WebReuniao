json.array!(@item_pauta) do |item_pautum|
  json.extract! item_pautum, :id, :observacao, :pautum_id, :questao_id
  json.url item_pautum_url(item_pautum, format: :json)
end
