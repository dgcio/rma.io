class Carriage < ActiveRecord::Base

	attr_protected :id

  	validates :serial, :model, :orientation, :status, :stype, :presence => true
  	validates :serial, :uniqueness => true, :numericality => true, :length => { :maximum => 12 }
  
end
