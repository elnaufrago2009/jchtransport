class NumberInvoice < ActiveRecord::Base
	has_many :facturas
	validates_presence_of :number
	validates_uniqueness_of :number
end
