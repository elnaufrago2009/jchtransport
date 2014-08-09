class SenderAddress < ActiveRecord::Base
	belongs_to :sender
	has_many :facturas
end
