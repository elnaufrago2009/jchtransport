class Factura < ActiveRecord::Base
  belongs_to :guide
  belongs_to :credito
  belongs_to :number_invoice
  belongs_to :sender_address
  has_many :elementos
  belongs_to :moneda
  #accepts_nested_attributes_for :elementos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :elementos, reject_if: proc { |attributes| attributes[:precio_venta].blank? }, :allow_destroy => true 

  validates_uniqueness_of :numero, message: '- Ya Existe'
  validates_presence_of :numero, message: '- En blanco'  
  validates_presence_of :fecha, message: '- En blanco'
  validates_presence_of :sender_address_id, message: '- En blanco'  
  validates_presence_of :moneda_id, message: '- En blanco'  
  #validates_presence_of :ruc, message: '- En blanco'
  #validates_presence_of :guide_id, message: '- En blanco'
  validates_presence_of :valor_venta, message: '- En blanco'
  validates_presence_of :igv, message: '- En blanco'
  validates_presence_of :precio_venta, message: '- En blanco'

end
