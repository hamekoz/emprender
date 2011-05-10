require 'test_helper'

class InstitucionesControllerTest < ActionController::TestCase
  setup do
    @institucion = instituciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instituciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institucion" do
    assert_difference('Institucion.count') do
      post :create, :institucion => @institucion.attributes
    end

    assert_redirected_to institucion_path(assigns(:institucion))
  end

  test "should show institucion" do
    get :show, :id => @institucion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @institucion.to_param
    assert_response :success
  end

  test "should update institucion" do
    put :update, :id => @institucion.to_param, :institucion => @institucion.attributes
    assert_redirected_to institucion_path(assigns(:institucion))
  end

  test "should destroy institucion" do
    assert_difference('Institucion.count', -1) do
      delete :destroy, :id => @institucion.to_param
    end

    assert_redirected_to instituciones_path
  end
end
