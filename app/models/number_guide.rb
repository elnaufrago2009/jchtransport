class NumberGuide < ActiveRecord::Base
	has_many :guides
	validates_presence_of :numero
	validates_uniqueness_of :numero
end
