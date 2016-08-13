require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { address1: @payment.address1, address2: @payment.address2, card_number: @payment.card_number, card_type: @payment.card_type, city: @payment.city, confirm_email: @payment.confirm_email, country: @payment.country, cvc_number: @payment.cvc_number, email_address: @payment.email_address, expire_date: @payment.expire_date, first_name: @payment.first_name, last_name: @payment.last_name }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    put :update, id: @payment, payment: { address1: @payment.address1, address2: @payment.address2, card_number: @payment.card_number, card_type: @payment.card_type, city: @payment.city, confirm_email: @payment.confirm_email, country: @payment.country, cvc_number: @payment.cvc_number, email_address: @payment.email_address, expire_date: @payment.expire_date, first_name: @payment.first_name, last_name: @payment.last_name }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
