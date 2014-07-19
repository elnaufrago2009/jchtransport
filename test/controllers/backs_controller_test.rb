require 'test_helper'

class BacksControllerTest < ActionController::TestCase
  setup do
    @back = backs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create back" do
    assert_difference('Back.count') do
      post :create, back: { descripcion: @back.descripcion, nombre: @back.nombre }
    end

    assert_redirected_to back_path(assigns(:back))
  end

  test "should show back" do
    get :show, id: @back
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @back
    assert_response :success
  end

  test "should update back" do
    patch :update, id: @back, back: { descripcion: @back.descripcion, nombre: @back.nombre }
    assert_redirected_to back_path(assigns(:back))
  end

  test "should destroy back" do
    assert_difference('Back.count', -1) do
      delete :destroy, id: @back
    end

    assert_redirected_to backs_path
  end
end
