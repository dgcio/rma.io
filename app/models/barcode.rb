class Barcode < ActiveRecord::Base
  belongs_to :mats
  attr_accessible :amount, :mats_id, :product_id, :type
end
