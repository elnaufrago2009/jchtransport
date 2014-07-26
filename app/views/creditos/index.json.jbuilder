json.array!(@creditos) do |credito|
  json.extract! credito, :id, :nombre
  json.url credito_url(credito, format: :json)
end
