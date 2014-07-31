require 'test_helper'

class NumberGuidesControllerTest < ActionController::TestCase
  setup do
    @number_guide = number_guides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:number_guides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create number_guide" do
    assert_difference('NumberGuide.count') do
      post :create, number_guide: { numero: @number_guide.numero }
    end

    assert_redirected_to number_guide_path(assigns(:number_guide))
  end

  test "should show number_guide" do
    get :show, id: @number_guide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @number_guide
    assert_response :success
  end

  test "should update number_guide" do
    patch :update, id: @number_guide, number_guide: { numero: @number_guide.numero }
    assert_redirected_to number_guide_path(assigns(:number_guide))
  end

  test "should destroy number_guide" do
    assert_difference('NumberGuide.count', -1) do
      delete :destroy, id: @number_guide
    end

    assert_redirected_to number_guides_path
  end
end
