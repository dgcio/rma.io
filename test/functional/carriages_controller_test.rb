require 'test_helper'

class CarriagesControllerTest < ActionController::TestCase
  setup do
    @carriage = carriages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carriages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carriage" do
    assert_difference('Carriage.count') do
      post :create, :carriage => @carriage.attributes
    end

    assert_redirected_to carriage_path(assigns(:carriage))
  end

  test "should show carriage" do
    get :show, :id => @carriage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @carriage.to_param
    assert_response :success
  end

  test "should update carriage" do
    put :update, :id => @carriage.to_param, :carriage => @carriage.attributes
    assert_redirected_to carriage_path(assigns(:carriage))
  end

  test "should destroy carriage" do
    assert_difference('Carriage.count', -1) do
      delete :destroy, :id => @carriage.to_param
    end

    assert_redirected_to carriages_path
  end
end
