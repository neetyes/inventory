class ItemsController < ApplicationController
  add_breadcrumb "Items", :items_path

  def new
    @item = Item.new
    @item.build_stock
    add_breadcrumb "New Items", :new_item_path
  end

  def create
    @item =Item.new(item_param)
    if @item.save
      @log = Log.create(description: "Added new item " +  @item.name, user: current_user )
      redirect_to @item
    else
      render 'new'
    end
  end

  def show
    @item= Item.find(params[:id])
  end

  def index
    @items =Item.all
    @number_of_items_per_page=5
    @page = params[:page] || 1
    @items = Item.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @item = Item.find(params[:id])
    @log = Log.create(description: "item edited " + @item.name, user: current_user )
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_param)
    redirect_to @item
  end

  def destroy
    @item = Item.destroy(params[:id])
    @log = Log.create(description: "item deleted " + @item.name, user: current_user )
    redirect_to @item
  end

  private
  def item_param
    params.require(:item).permit(:name, :unit_id, :item_code, :item_group_id, :description, stock_attributes: [:quantity, :unit_price, :est_sell_price])
  end
end
