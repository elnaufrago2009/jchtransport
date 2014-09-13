class District < ActiveRecord::Base
	belongs_to :province
	validates_presence_of :nombre

end
