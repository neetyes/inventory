class CustomersController < ApplicationController
  add_breadcrumb "Customer", :customers_path

  def new
    @customer = Customer.new
    add_breadcrumb "Add Customer", :new_customer_path
  end

  def create
    @customer =Customer.new(customer_param)
    if@customer.save
      @log = Log.create(description: "Added new customer " + @customer.name, user: current_user )
      redirect_to @customer
    else
      render 'new'
    end
  end

  def show
    @customer= Customer.find(params[:id])
  end

  def index
    @customers =Customer.all
    @number_of_customers_per_page=5
    @page = params[:page] || 1
    @customers = Customer.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @customer = Customer.find(params[:id])
    @log = Log.create(description: "customer edited " + @customer.name, user: current_user )
    add_breadcrumb "Edit Customer", :edit_customer_path
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_param)
    redirect_to @customer
  end

  def destroy
    @customer = Customer.destroy(params[:id])
    @log = Log.create(description: "customer deleted " + @customer.name, user: current_user )
    redirect_to @customer
  end

  private
  def customer_param
    params.require(:customer).permit(:name, :address, :contact_no, :email)
  end

end
