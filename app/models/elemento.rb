class Elemento < ActiveRecord::Base
  belongs_to :factura
  belongs_to :moneda
end
