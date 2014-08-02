class CreateElementos < ActiveRecord::Migration
  def change
    create_table :elementos do |t|
      t.integer :guide_id
      t.integer :item_id
      t.string :cantidad
      t.string :descripcion
      t.string :precio_unitario
      t.string :precio_venta
      t.integer :factura_id
      t.integer :moneda_id

      t.timestamps
    end
  end
end
