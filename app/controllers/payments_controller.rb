class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  def index
    @cart = current_cart
    @payments = Payment.paginate page: params[:page], order: 'created_at desc',per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @cart = current_cart
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
      @cart = current_cart
       if @cart.line_items.empty?
           redirect_to motorbikes_url, :notice => 'Your cart is empty'
           return
       end



    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
    @cart = current_cart
  end

  # POST /payments
  # POST /payments.json
  def create
    @cart = current_cart
    @payment = Payment.new(params[:payment])
    @payment.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @payment.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        flash[:notice] = "Thank you for your payment"
        format.html { render action: "thank_you"}

        format.json { render json: @payment, status: :created, location: @payment }
      else
        @cart = current_cart
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @cart = current_cart
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end


  def thank_you
  end




end
