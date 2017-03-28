class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @purchase.purchase_items.build
  end

  def create
    @purchase =Purchase.new(purchase_param)
    @company_profile = CompanyProfile.first
    @purchase.fiscal_year = @company_profile.fiscal_year
    if@purchase.save
      @log = Log.create(description: "Purchase items from" + @purchase.supplier.name, user: current_user )
      @purchase.purchase_items.each do |g|
        if g.present?
          @stocks = Stock.where(item_id: g.item_id)
          @stocks.each do |f|
            @stock = f
          end
          @stock.unit_price = ((@stock.unit_price * @stock.quantity) + (g.unit_price * g.quantity)) / (@stock.quantity + g.quantity)
          @stock.quantity = @stock.quantity + g.quantity
          @stock.save
        end
      end
      flash[:success] = "Items purchased successfully"

      redirect_to '/purchases/new'
    else
      @item = Item.order(:name)
      render 'new'
    end
  end

  def index
    @purchases =Purchase.all
    @number_of_purchases_per_page=5
    @page = params[:page] || 1
    @purchase = Purchase.paginate(:page => params[:page], :per_page => 10)
    @page = params[:page] || 1
    @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page => 100)
  end

  def edit
    @purchase = Purchase.find(params[:id])
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
