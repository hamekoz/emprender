require "minitest_helper"

class MensajesControllerTest < MiniTest::Rails::Controller
  before do
    @mensajes = mensajeses(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:mensajeses)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Mensajes.count') do
      post :create, mensajes: @mensajes.attributes
    end

    assert_redirected_to mensajes_path(assigns(:mensajes))
  end

  def test_show
    get :show, id: @mensajes.to_param
    assert_response :success
  end

  def test_edit
    get :edit, id: @mensajes.to_param
    assert_response :success
  end

  def test_update
    put :update, id: @mensajes.to_param, mensajes: @mensajes.attributes
    assert_redirected_to mensajes_path(assigns(:mensajes))
  end

  def test_destroy
    assert_difference('Mensajes.count', -1) do
      delete :destroy, id: @mensajes.to_param
    end

    assert_redirected_to mensajeses_path
  end
end
