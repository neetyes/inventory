class SalesController < ApplicationController
  add_breadcrumb "Sales", :sales_path

  def new
    @sale = Sale.new
    @sale.sale_items.build
    add_breadcrumb "Add Sale", :new_sale_path
  end

  def create
    @sale =Sale.new(sale_param)
    @company_profile = CompanyProfile.first
    @sale.fiscal_year = @company_profile.fiscal_year
    if@sale.save
      @log = Log.create(description: "Sold items to" + @sale.customer.name, user: current_user )
      @sale.sale_items.each do |g|
        if g.present?
          @stocks = Stock.where(item_id: g.item_id)
          @stocks.each do |f|
            @stock = f
          end
          @stock.quantity = @stock.quantity - g.quantity
          @stock.save
        end
      end
      flash[:success] = "Items Saled successfully"

      redirect_to '/sales/new'
    else
      @item = Item.order(:name)
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
    @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page => 10)
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
    params.require(:sale).permit(:customer_id, :bill_number, :sales_date, :discount, :tax, :grand_total, :credit_limit, sale_items_attributes: [:item_id, :quantity, :unit_price, :total])
  end

end
