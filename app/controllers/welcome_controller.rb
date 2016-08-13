class WelcomeController < ApplicationController


  def index
    @cart = current_cart
  end

  def about
    @cart = current_cart

  end


  def contact
    @cart = current_cart

  end



end
