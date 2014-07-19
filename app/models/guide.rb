class Guide < ActiveRecord::Base
	belongs_to :department

	belongs_to :partida_department, :class_name => 'Department', :foreign_key => 'partida_department_id'
	belongs_to :partida_province, :class_name => 'Province', :foreign_key => 'partida_province_id'
  	belongs_to :partida_district, :class_name => 'District', :foreign_key => 'partida_district_id'

  	belongs_to :llegada_department, :class_name => 'Department', :foreign_key => 'llegada_department_id'
  	belongs_to :llegada_province, :class_name => 'Province', :foreign_key => 'llegada_province_id'
  	belongs_to :llegada_district, :class_name => 'District', :foreign_key => 'llegada_district_id'

  	has_many :items

  	accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes[:codigo].blank? }, :allow_destroy => true

end
