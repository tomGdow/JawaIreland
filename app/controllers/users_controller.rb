class UsersController < ApplicationController
  before_filter :is_admin?
  skip_before_filter :is_admin?, :only => [:new, :create]

  def new
    @user = User.new
    @cart = current_cart

  end

  def create
    @user = User.new(params[:user])
    @cart = current_cart
    if @user.save
      redirect_to login_path, :notice => 'New user successfully created! You must now login'
    else
      render :action => 'new'
    end
  end

  def index
    @users = User.all
    @cart = current_cart
  end

  def show
    @user = User.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    @cart = current_cart

  end

  def update
    @user = User.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy


    respond_to do |format|
      format.html { redirect_to motorbikes_url, notice: 'User has been deleted.'  }
      format.json { head :no_content }
    end
     end




end
