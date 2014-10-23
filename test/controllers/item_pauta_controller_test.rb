require 'test_helper'

class ItemPautaControllerTest < ActionController::TestCase
  setup do
    @item_pautum = item_pauta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_pauta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_pautum" do
    assert_difference('ItemPautum.count') do
      post :create, item_pautum: { observacao: @item_pautum.observacao, pautum_id: @item_pautum.pautum_id, questao_id: @item_pautum.questao_id }
    end

    assert_redirected_to item_pautum_path(assigns(:item_pautum))
  end

  test "should show item_pautum" do
    get :show, id: @item_pautum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_pautum
    assert_response :success
  end

  test "should update item_pautum" do
    patch :update, id: @item_pautum, item_pautum: { observacao: @item_pautum.observacao, pautum_id: @item_pautum.pautum_id, questao_id: @item_pautum.questao_id }
    assert_redirected_to item_pautum_path(assigns(:item_pautum))
  end

  test "should destroy item_pautum" do
    assert_difference('ItemPautum.count', -1) do
      delete :destroy, id: @item_pautum
    end

    assert_redirected_to item_pauta_path
  end
end
