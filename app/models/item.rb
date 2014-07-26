class Item < ActiveRecord::Base
	belongs_to :guide
	belongs_to :unit
	belongs_to :measure
end
