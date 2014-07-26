json.array!(@elementos) do |elemento|
  json.extract! elemento, :id, :cantidad, :descripcion, :precio_unitario, :precio_venta, :facturas_id, :monedas_id
  json.url elemento_url(elemento, format: :json)
end
