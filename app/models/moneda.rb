class Moneda < ActiveRecord::Base
	has_many :facturas
	validates_presence_of :nombre
	validates_presence_of :simbolo
end
