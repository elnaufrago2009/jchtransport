class AddPlacaToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :placa, :string
  end
end
