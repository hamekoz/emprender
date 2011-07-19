require 'test_helper'

class PlanesSocialesControllerTest < ActionController::TestCase
  setup do
    @plan_social = planes_sociales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planes_sociales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan_social" do
    assert_difference('PlanSocial.count') do
      post :create, :plan_social => @plan_social.attributes
    end

    assert_redirected_to plan_social_path(assigns(:plan_social))
  end

  test "should show plan_social" do
    get :show, :id => @plan_social.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @plan_social.to_param
    assert_response :success
  end

  test "should update plan_social" do
    put :update, :id => @plan_social.to_param, :plan_social => @plan_social.attributes
    assert_redirected_to plan_social_path(assigns(:plan_social))
  end

  test "should destroy plan_social" do
    assert_difference('PlanSocial.count', -1) do
      delete :destroy, :id => @plan_social.to_param
    end

    assert_redirected_to planes_sociales_path
  end
end
