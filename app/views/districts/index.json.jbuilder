json.array!(@districts) do |district|
  json.extract! district, :id, :nombre
  json.url district_url(district, format: :json)
end
