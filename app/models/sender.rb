class Sender < ActiveRecord::Base
	has_many :guide
	has_many :facturas
	has_many :sender_addresses
	validates_presence_of :name_reason
		
	accepts_nested_attributes_for :sender_addresses, :reject_if => :all_blank, :allow_destroy => true
end
