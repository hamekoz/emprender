require 'test_helper'

class EmprendedoresControllerTest < ActionController::TestCase
  setup do
    @emprendedor = emprendedores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emprendedores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emprendedor" do
    assert_difference('Emprendedor.count') do
      post :create, emprendedor: {  }
    end

    assert_redirected_to emprendedor_path(assigns(:emprendedor))
  end

  test "should show emprendedor" do
    get :show, id: @emprendedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emprendedor
    assert_response :success
  end

  test "should update emprendedor" do
    put :update, id: @emprendedor, emprendedor: {  }
    assert_redirected_to emprendedor_path(assigns(:emprendedor))
  end

  test "should destroy emprendedor" do
    assert_difference('Emprendedor.count', -1) do
      delete :destroy, id: @emprendedor
    end

    assert_redirected_to emprendedores_path
  end
end
