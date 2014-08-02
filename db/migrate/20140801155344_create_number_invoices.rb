class CreateNumberInvoices < ActiveRecord::Migration
  def change
    create_table :number_invoices do |t|
      t.string :number

      t.timestamps
    end
  end
end
