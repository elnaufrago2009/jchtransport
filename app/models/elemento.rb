class Elemento < ActiveRecord::Base
  belongs_to :factura
  belongs_to :moneda
  belongs_to :item
  belongs_to :guide
end
