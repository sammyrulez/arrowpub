require 'test_helper'

class ShootingSessionsControllerTest < ActionController::TestCase
  setup do
    @shooting_session = shooting_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shooting_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shooting_session" do
    assert_difference('ShootingSession.count') do
      post :create, :shooting_session => @shooting_session.attributes
    end

    assert_redirected_to shooting_session_path(assigns(:shooting_session))
  end

  test "should show shooting_session" do
    get :show, :id => @shooting_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shooting_session.to_param
    assert_response :success
  end

  test "should update shooting_session" do
    put :update, :id => @shooting_session.to_param, :shooting_session => @shooting_session.attributes
    assert_redirected_to shooting_session_path(assigns(:shooting_session))
  end

  test "should destroy shooting_session" do
    assert_difference('ShootingSession.count', -1) do
      delete :destroy, :id => @shooting_session.to_param
    end

    assert_redirected_to shooting_sessions_path
  end
end
