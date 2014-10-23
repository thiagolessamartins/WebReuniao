json.array!(@convocados) do |convocado|
  json.extract! convocado, :id, :motivoAusencia, :presenca, :status, :pessoa_id, :reuniao_id
  json.url convocado_url(convocado, format: :json)
end
