require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "valid invoice" do
    invoice = invoices(:one)
    assert invoice.valid?
  end

  test "requires amount" do
    invoice = Invoice.new(trip: trips(:one), is_income: true)
    assert_not invoice.valid?
    assert_includes invoice.errors[:amount], "can't be blank"
  end

  test "belongs to trip" do
    invoice = invoices(:one)
    assert_equal trips(:one), invoice.trip
  end
end
