class Moneda < ActiveRecord::Base
	has_many :facturas
end
