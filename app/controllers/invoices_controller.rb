class InvoicesController < ApplicationController
	before_action :authenticate_user!

	before_action :set_trip
	before_action :set_invoice, only: [:destroy]

# GET trips/1/invoices
def index
	@invoices = @trip.invoices
end

# GET trips/1/invoices/new
def new
	@invoice = @trip.invoices.build
end

# GET trips/1/invoices/1/edit
def edit
end

# POST trips/1/invoices
def create
	@invoice = @trip.invoices.build(invoice_params)

	if @invoice.save
		redirect_to(@invoice.trip)
	else
		# redirect_to(@invoice.trip)
		render action: 'new'
	end
end

# DELETE trips/1/invoices/1
def destroy
	@invoice.destroy

	redirect_to trip_url(@trip)
end

private
# Use callbacks to share common setup or constraints between actions.
def set_trip
	@trip = Trip.find(params[:trip_id])
end

def set_invoice
	@invoice = @trip.invoices.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def invoice_params
	params.require(:invoice).permit(:description, :amount, :is_income)
end
end
