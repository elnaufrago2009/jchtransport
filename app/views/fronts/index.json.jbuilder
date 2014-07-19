json.array!(@fronts) do |front|
  json.extract! front, :id, :nombre, :descripcion
  json.url front_url(front, format: :json)
end
