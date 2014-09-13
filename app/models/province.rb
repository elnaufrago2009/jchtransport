class Province < ActiveRecord::Base
	belongs_to :department
	has_many :districts

	accepts_nested_attributes_for :districts, :reject_if => :all_blank, :allow_destroy => true
end
