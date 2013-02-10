class Inventory < ActiveRecord::Base
  attr_accessible :name, :artwork, :amount_left, :amount_per_box, :total_amount,
                  :wh_position, :department, :created_at, :updated_at
  attr_protected :id

  validates :name, :artwork, :amount_left, :amount_per_box, :presence => :true
end
