class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :numero_remision_guia
      t.date :fecha_emision
      t.date :fecha_inicio_traslado
      t.string :partida_direccion
      t.string :partida_district_id
      t.string :partida_province_id
      t.string :partida_department_id
      t.string :llegada_direccion
      t.string :llegada_district_id
      t.string :llegada_province_id
      t.string :llegada_department_id
      t.string :unidad_marca_vehiculo
      t.integer :front_id
      t.integer :back_id
      t.string :unidad_configuracion_vehicular
      t.string :conductor_certificado_inscripcion
      t.string :conductor_licencia_conducir
      t.string :empresa_subcontratada_nombre_apellido_razon_social
      t.string :empresa_subcontratada_ruc
      t.text :obsevaciones
      t.integer :sender_id
      t.integer :addressee_id
      t.integer :number_guide_id
      t.integer :estado

      t.timestamps
    end
  end
end
