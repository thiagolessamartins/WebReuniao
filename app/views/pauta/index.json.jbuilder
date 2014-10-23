json.array!(@pauta) do |pautum|
  json.extract! pautum, :id, :titulo, :data, :status
  json.url pautum_url(pautum, format: :json)
end
