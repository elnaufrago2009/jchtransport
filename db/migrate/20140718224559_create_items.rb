class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :codigo
      t.string :descripcion
      t.string :cantidad
      t.integer :measure_id      
      t.string :peso
      t.integer :unit_id
      t.string :precio_total
      t.integer :guide_id



      t.timestamps
    end
  end
end
