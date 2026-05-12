require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @trip = trips(:one)
    @invoice = invoices(:one)
    sign_in @user
  end

  test "should get new" do
    get new_trip_invoice_url(@trip)
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post trip_invoices_url(@trip), params: { invoice: {
        amount: "500.00",
        is_income: true
      } }
    end
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete trip_invoice_url(@trip, @invoice)
    end
    assert_redirected_to trip_url(@trip)
  end

  test "redirects to login when not authenticated" do
    sign_out @user
    get new_trip_invoice_url(@trip)
    assert_redirected_to new_user_session_path
  end
end
