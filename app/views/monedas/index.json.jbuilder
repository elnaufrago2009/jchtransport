json.array!(@monedas) do |moneda|
  json.extract! moneda, :id, :nombre, :simbolo
  json.url moneda_url(moneda, format: :json)
end
