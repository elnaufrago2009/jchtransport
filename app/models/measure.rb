class Measure < ActiveRecord::Base
	has_many :guides
	validates_presence_of :nombre
end
