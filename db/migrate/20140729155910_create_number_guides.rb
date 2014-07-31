class CreateNumberGuides < ActiveRecord::Migration
  def change
    create_table :number_guides do |t|
      t.string :numero

      t.timestamps
    end
  end
end
