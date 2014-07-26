json.array!(@facturas) do |factura|
  json.extract! factura, :id, :nombres, :ruc, :direccion, :fecha, :guides_id, :condiciones_pago, :efectivo, :cheque, :banco, :numero_cheque, :cancelado_fecha, :valor_venta, :igv, :precio_venta
  json.url factura_url(factura, format: :json)
end
