class Credito < ActiveRecord::Base
	has_many :facturas
	validates_presence_of :nombre
end
