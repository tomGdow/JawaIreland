require 'test_helper'

class MotorbikesControllerTest < ActionController::TestCase
  setup do
    @motorbike = motorbikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motorbikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motorbike" do
    assert_difference('Motorbike.count') do
      post :create, motorbike: { category: @motorbike.category, description: @motorbike.description, engineSize: @motorbike.engineSize, image: @motorbike.image, make: @motorbike.make, mileage: @motorbike.mileage, model: @motorbike.model, price: @motorbike.price, year: @motorbike.year }
    end

    assert_redirected_to motorbike_path(assigns(:motorbike))
  end

  test "should show motorbike" do
    get :show, id: @motorbike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motorbike
    assert_response :success
  end

  test "should update motorbike" do
    put :update, id: @motorbike, motorbike: { category: @motorbike.category, description: @motorbike.description, engineSize: @motorbike.engineSize, image: @motorbike.image, make: @motorbike.make, mileage: @motorbike.mileage, model: @motorbike.model, price: @motorbike.price, year: @motorbike.year }
    assert_redirected_to motorbike_path(assigns(:motorbike))
  end

  test "should destroy motorbike" do
    assert_difference('Motorbike.count', -1) do
      delete :destroy, id: @motorbike
    end

    assert_redirected_to motorbikes_path
  end
end
