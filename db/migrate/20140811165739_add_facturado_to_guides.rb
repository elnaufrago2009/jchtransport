class AddFacturadoToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :facturado, :integer
  end
end
