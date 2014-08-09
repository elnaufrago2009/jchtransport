class CreateSenderAddresses < ActiveRecord::Migration
  def change
    create_table :sender_addresses do |t|
      t.string :direccion
      t.integer :sender_id

      t.timestamps
    end
  end
end
