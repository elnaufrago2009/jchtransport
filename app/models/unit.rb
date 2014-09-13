class Unit < ActiveRecord::Base
	has_many :items	

	validates_presence_of :nombre
	validates_presence_of :und
end
