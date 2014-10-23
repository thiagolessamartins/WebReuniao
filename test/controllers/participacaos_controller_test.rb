require 'test_helper'

class ParticipacaosControllerTest < ActionController::TestCase
  setup do
    @participacao = participacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participacao" do
    assert_difference('Participacao.count') do
      post :create, participacao: { contribuicao: @participacao.contribuicao, pessoa_id: @participacao.pessoa_id, reuniao_id: @participacao.reuniao_id }
    end

    assert_redirected_to participacao_path(assigns(:participacao))
  end

  test "should show participacao" do
    get :show, id: @participacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participacao
    assert_response :success
  end

  test "should update participacao" do
    patch :update, id: @participacao, participacao: { contribuicao: @participacao.contribuicao, pessoa_id: @participacao.pessoa_id, reuniao_id: @participacao.reuniao_id }
    assert_redirected_to participacao_path(assigns(:participacao))
  end

  test "should destroy participacao" do
    assert_difference('Participacao.count', -1) do
      delete :destroy, id: @participacao
    end

    assert_redirected_to participacaos_path
  end
end
