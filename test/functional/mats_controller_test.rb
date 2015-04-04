require 'test_helper'

class MatsControllerTest < ActionController::TestCase
  setup do
    @mat = mats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mat" do
    assert_difference('Mat.count') do
      post :create, mat: { amount_left: @mat.amount_left, amount_per_box: @mat.amount_per_box, artwork: @mat.artwork, name: @mat.name, wh_position: @mat.wh_position }
    end

    assert_redirected_to mat_path(assigns(:mat))
  end

  test "should show mat" do
    get :show, id: @mat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mat
    assert_response :success
  end

  test "should update mat" do
    put :update, id: @mat, mat: { amount_left: @mat.amount_left, amount_per_box: @mat.amount_per_box, artwork: @mat.artwork, name: @mat.name, wh_position: @mat.wh_position }
    assert_redirected_to mat_path(assigns(:mat))
  end

  test "should destroy mat" do
    assert_difference('Mat.count', -1) do
      delete :destroy, id: @mat
    end

    assert_redirected_to mats_path
  end
end
