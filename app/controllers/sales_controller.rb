class SalesController < ApplicationController
  add_breadcrumb "Sales", :sales_path

  def new
    @sale = Sale.new
    @sale.sale_items.build
    add_breadcrumb "Add Sale", :new_sale_path
  end

  def create
    @sale =Sale.new(sale_param)
    if@sale.save
      redirect_to @sale
    else
      render 'new'
    end
  end

  def show
    @sale= Sale.find(params[:id])
  end

  def index
    @sales =Sale.all
    @number_of_sales_per_page=5
    @page = params[:page] || 1
    @sale = Sale.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @sale = Sale.find(params[:id])
    add_breadcrumb "Edit Sale"
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update(sale_param)
    redirect_to @sale
  end

  def destroy
    @sale = Sale.destroy(params[:id])
    redirect_to @sale
  end

  private
  def sale_param
    params.require(:sale).permit(:customer_id, :bill_number, :sale_date, :discount, :tax, :grand_total, sale_items_attributes: [:item_id, :quantity, :unit_price])
  end

end
