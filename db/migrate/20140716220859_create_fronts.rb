class CreateFronts < ActiveRecord::Migration
  def change
    create_table :fronts do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
