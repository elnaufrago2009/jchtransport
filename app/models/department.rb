class Department < ActiveRecord::Base
	has_many :provinces

	#has_many :partidas, :class_name => 'Guide', :foreign_key => 'partida_department_id'
  	#has_many :llegada, :class_name => 'Guide', :foreign_key => 'llegada_department_id'
  	validates_presence_of :nombre

  	accepts_nested_attributes_for :provinces, :reject_if => :all_blank, :allow_destroy => true
end
