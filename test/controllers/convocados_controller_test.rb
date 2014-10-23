require 'test_helper'

class ConvocadosControllerTest < ActionController::TestCase
  setup do
    @convocado = convocados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convocados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convocado" do
    assert_difference('Convocado.count') do
      post :create, convocado: { motivoAusencia: @convocado.motivoAusencia, pessoa_id: @convocado.pessoa_id, presenca: @convocado.presenca, reuniao_id: @convocado.reuniao_id, status: @convocado.status }
    end

    assert_redirected_to convocado_path(assigns(:convocado))
  end

  test "should show convocado" do
    get :show, id: @convocado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @convocado
    assert_response :success
  end

  test "should update convocado" do
    patch :update, id: @convocado, convocado: { motivoAusencia: @convocado.motivoAusencia, pessoa_id: @convocado.pessoa_id, presenca: @convocado.presenca, reuniao_id: @convocado.reuniao_id, status: @convocado.status }
    assert_redirected_to convocado_path(assigns(:convocado))
  end

  test "should destroy convocado" do
    assert_difference('Convocado.count', -1) do
      delete :destroy, id: @convocado
    end

    assert_redirected_to convocados_path
  end
end
