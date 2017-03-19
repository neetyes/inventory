class StocksController < ApplicationController
  add_breadcrumb "Stocks", :stocks_path

  def new
    @stock = Stock.new
    add_breadcrumb "Add Stock", :new_stock_path
  end

  def create
    @stock =Stock.new(stock_param)
    if@stock.save
      redirect_to @stock
    else
      render 'new'
    end
  end

  def show
    @stock= Stock.find(params[:id])
  end

  def index
    @stocks =Stock.all
    @number_of_items_per_page=5
    @page = params[:page] || 1
    @stock = Stock.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @stock = Stock.find(params[:id])
    add_breadcrumb "Edit Stock"
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update(stock_param)
    redirect_to @stock
  end

  def destroy
    @stock = Stock.destroy(params[:id])
    redirect_to @stock
  end

  private
  def stock_param
    params.require(:stock).permit(:item_id, :quantity, :unit_price, :est_sell_price)
  end

end
