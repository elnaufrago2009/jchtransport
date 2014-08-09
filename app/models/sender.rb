class Sender < ActiveRecord::Base
	has_many :guide
	has_many :facturas
	has_many :sender_addresses
end
