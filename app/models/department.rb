class Department < ActiveRecord::Base
	has_many :provinces

	#has_many :partidas, :class_name => 'Guide', :foreign_key => 'partida_department_id'
  	#has_many :llegada, :class_name => 'Guide', :foreign_key => 'llegada_department_id'
end
