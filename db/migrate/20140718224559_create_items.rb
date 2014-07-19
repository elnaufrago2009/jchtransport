class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :codigo
      t.string :descripcion
      t.string :cantidad
      t.string :unidad
      t.string :peso
      t.integer :guide_id

      t.timestamps
    end
  end
end
