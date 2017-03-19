class PurchasesController < ApplicationController
  add_breadcrumb "Purchases", :purchases_path

  def new
    @purchase = Purchase.new
    @purchase.purchase_items.build
    add_breadcrumb "Add Purchase", :new_purchase_path
  end

  def create
    @purchase =Purchase.new(purchase_param)
    if@purchase.save
      redirect_to @purchase
    else
      render 'new'
    end
  end

  def show
    @purchase= Purchase.find(params[:id])
  end

  def index
    @purchases =Purchase.all
    @number_of_purchases_per_page=5
    @page = params[:page] || 1
    @purchase = Purchase.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @purchase = Purchase.find(params[:id])
    add_breadcrumb "Edit Purchase"
  end

  def update
    @purchase = Purchase.find(params[:id])
    @purchase.update(purchase_param)
    redirect_to @purchase
  end

  def destroy
    @purchase = Purchase.destroy(params[:id])
    redirect_to @purchase
  end

  private
  def purchase_param
    params.require(:purchase).permit(:supplier_id, :bill_number, :purchase_date, :discount, :tax, :grand_total, :fiscal_year_id, purchase_items_attributes: [:item_id, :quantity, :unit_price, :total, :purchase_id ])
  end
end
