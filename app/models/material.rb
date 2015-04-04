class Material < ActiveRecord::Base
  attr_accessible :amount_left, :amount_per_box, :artwork, :name, :wh_position
end
