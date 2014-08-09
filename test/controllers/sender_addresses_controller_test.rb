require 'test_helper'

class SenderAddressesControllerTest < ActionController::TestCase
  setup do
    @sender_address = sender_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sender_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sender_address" do
    assert_difference('SenderAddress.count') do
      post :create, sender_address: { direccion: @sender_address.direccion, sender_id: @sender_address.sender_id }
    end

    assert_redirected_to sender_address_path(assigns(:sender_address))
  end

  test "should show sender_address" do
    get :show, id: @sender_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sender_address
    assert_response :success
  end

  test "should update sender_address" do
    patch :update, id: @sender_address, sender_address: { direccion: @sender_address.direccion, sender_id: @sender_address.sender_id }
    assert_redirected_to sender_address_path(assigns(:sender_address))
  end

  test "should destroy sender_address" do
    assert_difference('SenderAddress.count', -1) do
      delete :destroy, id: @sender_address
    end

    assert_redirected_to sender_addresses_path
  end
end
