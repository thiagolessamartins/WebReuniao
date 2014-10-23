require 'test_helper'

class PautaControllerTest < ActionController::TestCase
  setup do
    @pautum = pauta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pauta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pautum" do
    assert_difference('Pautum.count') do
      post :create, pautum: { data: @pautum.data, status: @pautum.status, titulo: @pautum.titulo }
    end

    assert_redirected_to pautum_path(assigns(:pautum))
  end

  test "should show pautum" do
    get :show, id: @pautum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pautum
    assert_response :success
  end

  test "should update pautum" do
    patch :update, id: @pautum, pautum: { data: @pautum.data, status: @pautum.status, titulo: @pautum.titulo }
    assert_redirected_to pautum_path(assigns(:pautum))
  end

  test "should destroy pautum" do
    assert_difference('Pautum.count', -1) do
      delete :destroy, id: @pautum
    end

    assert_redirected_to pauta_path
  end
end
