class Factura < ActiveRecord::Base
  belongs_to :guide
  belongs_to :credito
  belongs_to :number_invoice
  has_many :elementos
  accepts_nested_attributes_for :elementos, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :numero, message: '- En blanco'
  validates_presence_of :nombres, message: '- En blanco'
  validates_presence_of :fecha, message: '- En blanco'
  validates_presence_of :ruc, message: '- En blanco'
  validates_presence_of :guide_id, message: '- En blanco'
  validates_presence_of :valor_venta, message: '- En blanco'
  validates_presence_of :igv, message: '- En blanco'
  validates_presence_of :precio_venta, message: '- En blanco'

end
