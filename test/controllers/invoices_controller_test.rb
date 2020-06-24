require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index, params: { trip_id: @trip }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { trip_id: @trip }
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, params: { trip_id: @trip, invoice: @invoice.attributes }
    end

    assert_redirected_to trip_invoice_path(@trip, Invoice.last)
  end

  test "should show invoice" do
    get :show, params: { trip_id: @trip, id: @invoice }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { trip_id: @trip, id: @invoice }
    assert_response :success
  end

  test "should update invoice" do
    put :update, params: { trip_id: @trip, id: @invoice, invoice: @invoice.attributes }
    assert_redirected_to trip_invoice_path(@trip, Invoice.last)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, params: { trip_id: @trip, id: @invoice }
    end

    assert_redirected_to trip_invoices_path(@trip)
  end
end
