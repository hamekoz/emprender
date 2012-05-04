require "minitest_helper"

class PerfilControllerTest < MiniTest::Rails::Controller
  before do
    @perfil = perfiles(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:perfiles)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Perfil.count') do
      post :create, perfil: @perfil.attributes
    end

    assert_redirected_to perfil_path(assigns(:perfil))
  end

  def test_show
    get :show, id: @perfil.to_param
    assert_response :success
  end

  def test_edit
    get :edit, id: @perfil.to_param
    assert_response :success
  end

  def test_update
    put :update, id: @perfil.to_param, perfil: @perfil.attributes
    assert_redirected_to perfil_path(assigns(:perfil))
  end

  def test_destroy
    assert_difference('Perfil.count', -1) do
      delete :destroy, id: @perfil.to_param
    end

    assert_redirected_to perfiles_path
  end
end
