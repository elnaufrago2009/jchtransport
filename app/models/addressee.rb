class Addressee < ActiveRecord::Base
	has_many :guide
	validates_presence_of :name_reason
end
