json.array!(@guides) do |guide|
  json.extract! guide, :id, :numero_remision_guia, :fecha_emision, :fecha_inicio_traslado, :partida_direccion, :partida_district_id, :partida_province_id, :partida_department_id, :llegada_direccion, :llegada_district_id, :llegada_province_id, :llegada_department_id, :remitente_apellido_nombre_razon_social, :remitente_ruc, :remitente_dni, :destinatario_apellido_nombre_razon_social, :destinatario_ruc, :destinatario_dni, :unidad_marca_vehiculo, :unidad_placa_delantera, :unidad_placa_trasera, :unidad_configuracion_vehicular, :conductor_certificado_inscripcion, :conductor_licencia_conducir, :empresa_subcontratada_nombre_apellido_razon_social, :empresa_subcontratada_ruc, :obsevaciones
  json.url guide_url(guide, format: :json)
end
