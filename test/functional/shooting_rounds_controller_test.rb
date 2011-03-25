require 'test_helper'

class ShootingRoundsControllerTest < ActionController::TestCase
  setup do
    @shooting_round = shooting_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shooting_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shooting_round" do
    assert_difference('ShootingRound.count') do
      post :create, :shooting_round => @shooting_round.attributes
    end

    assert_redirected_to shooting_round_path(assigns(:shooting_round))
  end

  test "should show shooting_round" do
    get :show, :id => @shooting_round.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shooting_round.to_param
    assert_response :success
  end

  test "should update shooting_round" do
    put :update, :id => @shooting_round.to_param, :shooting_round => @shooting_round.attributes
    assert_redirected_to shooting_round_path(assigns(:shooting_round))
  end

  test "should destroy shooting_round" do
    assert_difference('ShootingRound.count', -1) do
      delete :destroy, :id => @shooting_round.to_param
    end

    assert_redirected_to shooting_rounds_path
  end
end
