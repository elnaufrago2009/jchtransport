json.array!(@backs) do |back|
  json.extract! back, :id, :nombre, :descripcion
  json.url back_url(back, format: :json)
end
