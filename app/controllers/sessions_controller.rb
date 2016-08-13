class SessionsController < ApplicationController

  def index
   @cart = current_cart
   @user = current_user

  end

  def new
    @cart = current_cart
  end


  def create

    if user = User.authenticate(params[:username], params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), :notice => "You have logged in successfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, :notice => "You have logged out successfully"
  end


end
