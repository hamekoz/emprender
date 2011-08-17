require 'test_helper'

class ClasificacionesControllerTest < ActionController::TestCase
  setup do
    @clasificacion = clasificaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clasificaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clasificacion" do
    assert_difference('Clasificacion.count') do
      post :create, :clasificacion => @clasificacion.attributes
    end

    assert_redirected_to clasificacion_path(assigns(:clasificacion))
  end

  test "should show clasificacion" do
    get :show, :id => @clasificacion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @clasificacion.to_param
    assert_response :success
  end

  test "should update clasificacion" do
    put :update, :id => @clasificacion.to_param, :clasificacion => @clasificacion.attributes
    assert_redirected_to clasificacion_path(assigns(:clasificacion))
  end

  test "should destroy clasificacion" do
    assert_difference('Clasificacion.count', -1) do
      delete :destroy, :id => @clasificacion.to_param
    end

    assert_redirected_to clasificaciones_path
  end
end
