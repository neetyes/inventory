class SuppliersController < ApplicationController
  add_breadcrumb "Supplier", :suppliers_path

  def new
    @supplier = Supplier.new
    add_breadcrumb "Add Supplier", :new_supplier_path
  end

  def create
    @supplier =Supplier.new(supplier_param)
    if@supplier.save
      @log = Log.create(description: "Added new Supplier " +  @supplier.name, user: current_user )
      redirect_to @supplier
    else
      render 'new'
    end
  end

  def show
    @supplier= Supplier.find(params[:id])
  end

  def index
    @suppliers =Supplier.all
    @number_of_customers_per_page=5
    @page = params[:page] || 1
    @suppliers = Supplier.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @supplier = Supplier.find(params[:id])
    @log = Log.create(description: "Supplier edited " + @supplier.name, user: current_user )
    add_breadcrumb "Edit Supplier", :edit_supplier_path
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(supplier_param)
    redirect_to @supplier
  end

  def destroy
    @supplier = Supplier.destroy(params[:id])
    @log = Log.create(description: "Supplier deleted " + @supplier.name, user: current_user )
    redirect_to @supplier
  end

  private
  def supplier_param
    params.require(:supplier).permit(:name, :address, :contact_no, :email)
  end

end
