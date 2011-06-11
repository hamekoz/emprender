require 'test_helper'

class PostulantesControllerTest < ActionController::TestCase
  setup do
    @postulante = postulantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulante" do
    assert_difference('Postulante.count') do
      post :create, :postulante => @postulante.attributes
    end

    assert_redirected_to postulante_path(assigns(:postulante))
  end

  test "should show postulante" do
    get :show, :id => @postulante.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @postulante.to_param
    assert_response :success
  end

  test "should update postulante" do
    put :update, :id => @postulante.to_param, :postulante => @postulante.attributes
    assert_redirected_to postulante_path(assigns(:postulante))
  end

  test "should destroy postulante" do
    assert_difference('Postulante.count', -1) do
      delete :destroy, :id => @postulante.to_param
    end

    assert_redirected_to postulantes_path
  end
end
