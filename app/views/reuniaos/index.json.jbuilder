json.array!(@reuniaos) do |reuniao|
  json.extract! reuniao, :id, :titulo, :data, :horaInicio, :horaFim, :status, :local_id, :pautum_id, :atum_id, :categoria
  json.url reuniao_url(reuniao, format: :json)
end
