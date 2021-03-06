class Guide < ActiveRecord::Base

	belongs_to :partida_department, :class_name => 'Department', :foreign_key => 'partida_department_id'
	belongs_to :partida_province, :class_name => 'Province', :foreign_key => 'partida_province_id'
  belongs_to :partida_district, :class_name => 'District', :foreign_key => 'partida_district_id'

  belongs_to :llegada_department, :class_name => 'Department', :foreign_key => 'llegada_department_id'
  belongs_to :llegada_province, :class_name => 'Province', :foreign_key => 'llegada_province_id'
  belongs_to :llegada_district, :class_name => 'District', :foreign_key => 'llegada_district_id'

  has_many :items
  has_many :facturas

  belongs_to :front
  belongs_to :back

  belongs_to :sender
  belongs_to :addressee

  belongs_to :number_guide
  belongs_to :elemento

  #accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes[:codigo].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true

  validates_uniqueness_of :numero_remision_guia, message: '- Ya Existe'
  validates_presence_of :numero_remision_guia, message: '- En blanco'
  validates_presence_of :fecha_emision
  validates_presence_of :fecha_inicio_traslado, message: '- En blanco'
  validates_presence_of :sender_id, message: '- En blanco'
  validates_presence_of :addressee_id, message: '- En blanco' 
  validates_presence_of :partida_direccion, message: '- En blanco' 
  validates_presence_of :partida_district_id, message: '- En blanco'
  validates_presence_of :llegada_direccion, message: '- En blanco'
  validates_presence_of :llegada_district_id, message: '- En blanco'
end
