require "minitest_helper"

class MensajeControllerTest < MiniTest::Rails::Controller
  before do
    @mensaj = mensajes(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:mensajes)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Mensaje.count') do
      post :create, mensaj: @mensaj.attributes
    end

    assert_redirected_to mensaj_path(assigns(:mensaj))
  end

  def test_show
    get :show, id: @mensaj.to_param
    assert_response :success
  end

  def test_edit
    get :edit, id: @mensaj.to_param
    assert_response :success
  end

  def test_update
    put :update, id: @mensaj.to_param, mensaj: @mensaj.attributes
    assert_redirected_to mensaj_path(assigns(:mensaj))
  end

  def test_destroy
    assert_difference('Mensaje.count', -1) do
      delete :destroy, id: @mensaj.to_param
    end

    assert_redirected_to mensajes_path
  end
end
