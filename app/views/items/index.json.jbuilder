json.array!(@items) do |item|
  json.extract! item, :id, :codigo, :descripcion, :cantidad, :unidad, :peso, :guide_id
  json.url item_url(item, format: :json)
end
