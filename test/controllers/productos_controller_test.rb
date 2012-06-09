require "minitest_helper"

class ProductosControllerTest < MiniTest::Rails::Controller
  before do
    @productos = productoses(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:productoses)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Productos.count') do
      post :create, productos: @productos.attributes
    end

    assert_redirected_to productos_path(assigns(:productos))
  end

  def test_show
    get :show, id: @productos.to_param
    assert_response :success
  end

  def test_edit
    get :edit, id: @productos.to_param
    assert_response :success
  end

  def test_update
    put :update, id: @productos.to_param, productos: @productos.attributes
    assert_redirected_to productos_path(assigns(:productos))
  end

  def test_destroy
    assert_difference('Productos.count', -1) do
      delete :destroy, id: @productos.to_param
    end

    assert_redirected_to productoses_path
  end
end
