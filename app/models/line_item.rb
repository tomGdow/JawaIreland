class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :motorbike_id, :motorbike, :quantity

  belongs_to :motorbike
  belongs_to :cart
  belongs_to :payment
end
