json.array!(@categories) do |category|
  json.extract! category, :id, :titulo
  json.url category_url(category, format: :json)
end
