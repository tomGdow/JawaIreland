class CombineItemsInCart < ActiveRecord::Migration
  def self.up
      Cart.all.each do |cart|
        sums = cart.line_items.group(:motorbike_id).sum(:quantity)

        sums.each do |motorbike_id, quantity|
            if quantity  > 1
              cart.line_items.where(:motorbike_id => motorbike_id).delete_all

              cart.line_items.create(:motorbike_id => motorbike_id, :quantity => quantity)
            end
        end
      end
  end

  def self.down
    LineItem.where("quantity > 1").each do |line_item|
      line_item.quantity.times do
        LineItem.create :cart_id => line_item.cart_id, :motorbike_id => line_item.motorbike_id, :quantity => 1
      end
      line_item.destroy
    end
  end
end
