class Mat < ActiveRecord::Base
  attr_accessible :amount_left, :amount_per_box, :artwork, :name, :wh_position
  validates :amount_left, :amount_per_box, :name, :presence => true
end
