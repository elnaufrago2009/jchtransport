require 'test_helper'

class NumberInvoicesControllerTest < ActionController::TestCase
  setup do
    @number_invoice = number_invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:number_invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create number_invoice" do
    assert_difference('NumberInvoice.count') do
      post :create, number_invoice: { number: @number_invoice.number }
    end

    assert_redirected_to number_invoice_path(assigns(:number_invoice))
  end

  test "should show number_invoice" do
    get :show, id: @number_invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @number_invoice
    assert_response :success
  end

  test "should update number_invoice" do
    patch :update, id: @number_invoice, number_invoice: { number: @number_invoice.number }
    assert_redirected_to number_invoice_path(assigns(:number_invoice))
  end

  test "should destroy number_invoice" do
    assert_difference('NumberInvoice.count', -1) do
      delete :destroy, id: @number_invoice
    end

    assert_redirected_to number_invoices_path
  end
end
