class Payment < ActiveRecord::Base
  attr_accessible :address1, :address2, :card_number, :card_type, :city, :confirm_email, :country, :cvc_number, :email_address, :expire_date, :first_name, :last_name
  has_many :line_items, dependent: :destroy

  CARD_TYPES = ["Visa", "Master card", "Laser", "Ryanair"]


  validates :city,
            :first_name,
            :last_name,
            :country,
            :expire_date,
            :cvc_number,
            :card_type,
            :card_number,
            :address1,
            :presence => true

  validates :city,
            :first_name,
            :last_name,
            :country,
            :length => {:within => 3..25}


  validates :card_number,
            :expire_date,
            :cvc_number,
            :numericality => true

  validates :card_number,
            :length => { :is => 16 }

  validates :expire_date,
            :length => { :is => 4 }

  validates :cvc_number,
            :length => { :is => 3 }


  validates   :email_address,
              :length => {:within => 5..25},
              :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}


  validates   :confirm_email,
              :length => {:within => 5..25},
              :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}





  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end


end
