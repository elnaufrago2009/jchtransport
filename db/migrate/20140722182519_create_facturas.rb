class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.string :numero
      t.string :nombres
      t.string :ruc
      t.string :direccion
      t.date :fecha
      t.integer :guide_id
      t.string :condiciones_pago
      t.boolean :efectivo
      t.boolean :cheque
      t.string :banco
      t.string :numero_cheque
      t.date :cancelado_fecha
      t.string :valor_venta
      t.string :igv
      t.string :precio_venta
      t.integer :credito_id

      t.timestamps
    end
  end
end
