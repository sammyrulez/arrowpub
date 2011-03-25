require 'test_helper'

class ShootingRangesControllerTest < ActionController::TestCase
  setup do
    @shooting_range = shooting_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shooting_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shooting_range" do
    assert_difference('ShootingRange.count') do
      post :create, :shooting_range => @shooting_range.attributes
    end

    assert_redirected_to shooting_range_path(assigns(:shooting_range))
  end

  test "should show shooting_range" do
    get :show, :id => @shooting_range.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shooting_range.to_param
    assert_response :success
  end

  test "should update shooting_range" do
    put :update, :id => @shooting_range.to_param, :shooting_range => @shooting_range.attributes
    assert_redirected_to shooting_range_path(assigns(:shooting_range))
  end

  test "should destroy shooting_range" do
    assert_difference('ShootingRange.count', -1) do
      delete :destroy, :id => @shooting_range.to_param
    end

    assert_redirected_to shooting_ranges_path
  end
end
