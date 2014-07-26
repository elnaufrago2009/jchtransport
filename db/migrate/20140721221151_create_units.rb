class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :nombre
      t.string :und

      t.timestamps
    end
  end
end
