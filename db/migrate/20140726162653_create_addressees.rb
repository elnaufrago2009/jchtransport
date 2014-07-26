class CreateAddressees < ActiveRecord::Migration
  def change
    create_table :addressees do |t|
      t.string :name_reason
      t.string :ruc
      t.string :identity_document

      t.timestamps
    end
  end
end
