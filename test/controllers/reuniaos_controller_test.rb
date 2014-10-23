require 'test_helper'

class ReuniaosControllerTest < ActionController::TestCase
  setup do
    @reuniao = reuniaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reuniaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reuniao" do
    assert_difference('Reuniao.count') do
      post :create, reuniao: { atum_id: @reuniao.atum_id, categoria: @reuniao.categoria, data: @reuniao.data, horaFim: @reuniao.horaFim, horaInicio: @reuniao.horaInicio, local_id: @reuniao.local_id, pautum_id: @reuniao.pautum_id, status: @reuniao.status, titulo: @reuniao.titulo }
    end

    assert_redirected_to reuniao_path(assigns(:reuniao))
  end

  test "should show reuniao" do
    get :show, id: @reuniao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reuniao
    assert_response :success
  end

  test "should update reuniao" do
    patch :update, id: @reuniao, reuniao: { atum_id: @reuniao.atum_id, categoria: @reuniao.categoria, data: @reuniao.data, horaFim: @reuniao.horaFim, horaInicio: @reuniao.horaInicio, local_id: @reuniao.local_id, pautum_id: @reuniao.pautum_id, status: @reuniao.status, titulo: @reuniao.titulo }
    assert_redirected_to reuniao_path(assigns(:reuniao))
  end

  test "should destroy reuniao" do
    assert_difference('Reuniao.count', -1) do
      delete :destroy, id: @reuniao
    end

    assert_redirected_to reuniaos_path
  end
end
