class SenderAddress < ActiveRecord::Base
	belongs_to :sender
	has_many :facturas
	#validates_presence_of :sender_id
	validates_presence_of :direccion
end
