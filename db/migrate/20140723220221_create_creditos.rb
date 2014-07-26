class CreateCreditos < ActiveRecord::Migration
  def change
    create_table :creditos do |t|
      t.string :nombre      

      t.timestamps
    end
  end
end
