require "minitest_helper"

class ProductoControllerTest < MiniTest::Rails::Controller
  before do
    @producto = productos(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:productos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Producto.count') do
      post :create, producto: @producto.attributes
    end

    assert_redirected_to producto_path(assigns(:producto))
  end

  def test_show
    get :show, id: @producto.to_param
    assert_response :success
  end

  def test_edit
    get :edit, id: @producto.to_param
    assert_response :success
  end

  def test_update
    put :update, id: @producto.to_param, producto: @producto.attributes
    assert_redirected_to producto_path(assigns(:producto))
  end

  def test_destroy
    assert_difference('Producto.count', -1) do
      delete :destroy, id: @producto.to_param
    end

    assert_redirected_to productos_path
  end
end
