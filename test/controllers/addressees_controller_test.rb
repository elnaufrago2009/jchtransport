require 'test_helper'

class AddresseesControllerTest < ActionController::TestCase
  setup do
    @addressee = addressees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addressees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create addressee" do
    assert_difference('Addressee.count') do
      post :create, addressee: { identity_document: @addressee.identity_document, name_reason: @addressee.name_reason, ruc: @addressee.ruc }
    end

    assert_redirected_to addressee_path(assigns(:addressee))
  end

  test "should show addressee" do
    get :show, id: @addressee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @addressee
    assert_response :success
  end

  test "should update addressee" do
    patch :update, id: @addressee, addressee: { identity_document: @addressee.identity_document, name_reason: @addressee.name_reason, ruc: @addressee.ruc }
    assert_redirected_to addressee_path(assigns(:addressee))
  end

  test "should destroy addressee" do
    assert_difference('Addressee.count', -1) do
      delete :destroy, id: @addressee
    end

    assert_redirected_to addressees_path
  end
end
