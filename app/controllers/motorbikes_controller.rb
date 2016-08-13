class MotorbikesController < ApplicationController
  # GET /motorbikes
  # GET /motorbikes.json

  before_filter :authenticate, :except => [:index, :show]

  def index
    @cart = current_cart
    @motorbikes = Motorbike.paginate(:per_page => 3,
                                     :page => params[:page],
                                     :order => "created_at DESC").search(params[:search_query], params[:search])




    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motorbikes }
    end
  end

  # GET /motorbikes/1
  # GET /motorbikes/1.json
  def show
    @motorbike = Motorbike.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motorbike }
    end
  end

  # GET /motorbikes/new
  # GET /motorbikes/new.json
  def new
    @motorbike = Motorbike.new
    @cart = current_cart

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motorbike }
    end
  end

  # GET /motorbikes/1/edit
  def edit
    @motorbike = Motorbike.find(params[:id])
    @cart = current_cart

  end

  # POST /motorbikes
  # POST /motorbikes.json
  def create
    @motorbike = current_user.motorbikes.new(params[:motorbike])
    @cart = current_cart

    respond_to do |format|
      if @motorbike.save
        format.html { redirect_to @motorbike, notice: 'Motorbike was successfully created.' }
        format.json { render json: @motorbike, status: :created, location: @motorbike }
      else
        format.html { render action: "new" }
        format.json { render json: @motorbike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /motorbikes/1
  # PUT /motorbikes/1.json
  def update
    @motorbike = Motorbike.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      if @motorbike.update_attributes(params[:motorbike])
        format.html { redirect_to @motorbike, notice: 'Motorbike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @motorbike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motorbikes/1
  # DELETE /motorbikes/1.json
  def destroy
    @motorbike = Motorbike.find(params[:id])
    @motorbike.destroy

    respond_to do |format|
      format.html { redirect_to motorbikes_url }
      format.json { head :no_content }
    end
  end

  def who_bought
    @motorbike = Motorbike.find(params[:id])
    respond_to do |format|
      format.atom
    end
  end
end
