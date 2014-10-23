json.array!(@ata) do |atum|
  json.extract! atum, :id, :status, :pdfAta
  json.url atum_url(atum, format: :json)
end
