require 'test_helper'

class AtaControllerTest < ActionController::TestCase
  setup do
    @atum = ata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atum" do
    assert_difference('Atum.count') do
      post :create, atum: { pdfAta: @atum.pdfAta, status: @atum.status }
    end

    assert_redirected_to atum_path(assigns(:atum))
  end

  test "should show atum" do
    get :show, id: @atum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atum
    assert_response :success
  end

  test "should update atum" do
    patch :update, id: @atum, atum: { pdfAta: @atum.pdfAta, status: @atum.status }
    assert_redirected_to atum_path(assigns(:atum))
  end

  test "should destroy atum" do
    assert_difference('Atum.count', -1) do
      delete :destroy, id: @atum
    end

    assert_redirected_to ata_path
  end
end
