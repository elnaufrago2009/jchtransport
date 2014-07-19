class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :nombre
      t.integer :province_id

      t.timestamps
    end
  end
end
