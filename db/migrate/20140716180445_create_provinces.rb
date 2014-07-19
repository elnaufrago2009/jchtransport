class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :nombre
      t.integer :department_id

      t.timestamps
    end
  end
end
