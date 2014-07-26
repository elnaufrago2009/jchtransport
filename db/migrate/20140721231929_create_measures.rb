class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :nombre
      t.string :und

      t.timestamps
    end
  end
end
