require 'test_helper'

class SugestaoItemPautaControllerTest < ActionController::TestCase
  setup do
    @sugestao_item_pautum = sugestao_item_pauta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sugestao_item_pauta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sugestao_item_pautum" do
    assert_difference('SugestaoItemPautum.count') do
      post :create, sugestao_item_pautum: { aprovar: @sugestao_item_pautum.aprovar, motivoReprovar: @sugestao_item_pautum.motivoReprovar, motivoSugestao: @sugestao_item_pautum.motivoSugestao, pessoa_id: @sugestao_item_pautum.pessoa_id, questao_id: @sugestao_item_pautum.questao_id, reuniao_id: @sugestao_item_pautum.reuniao_id }
    end

    assert_redirected_to sugestao_item_pautum_path(assigns(:sugestao_item_pautum))
  end

  test "should show sugestao_item_pautum" do
    get :show, id: @sugestao_item_pautum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sugestao_item_pautum
    assert_response :success
  end

  test "should update sugestao_item_pautum" do
    patch :update, id: @sugestao_item_pautum, sugestao_item_pautum: { aprovar: @sugestao_item_pautum.aprovar, motivoReprovar: @sugestao_item_pautum.motivoReprovar, motivoSugestao: @sugestao_item_pautum.motivoSugestao, pessoa_id: @sugestao_item_pautum.pessoa_id, questao_id: @sugestao_item_pautum.questao_id, reuniao_id: @sugestao_item_pautum.reuniao_id }
    assert_redirected_to sugestao_item_pautum_path(assigns(:sugestao_item_pautum))
  end

  test "should destroy sugestao_item_pautum" do
    assert_difference('SugestaoItemPautum.count', -1) do
      delete :destroy, id: @sugestao_item_pautum
    end

    assert_redirected_to sugestao_item_pauta_path
  end
end
