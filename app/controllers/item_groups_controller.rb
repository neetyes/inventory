class ItemGroupsController < ApplicationController
  add_breadcrumb "Item Group", :item_groups_path

  def new
    @item_group = ItemGroup.new
    add_breadcrumb "Add Item Group", :new_item_group_path
  end

  def create
    @item_group =ItemGroup.new(item_group_param)
    if@item_group.save
      @log = Log.create(description: "Added new item group " +  @item_group.name, user: current_user )
      redirect_to @item_group
    else
      render 'new'
    end
  end

  def show
    @item_group= ItemGroup.find(params[:id])
  end

  def index
    @item_groups =ItemGroup.all
    @number_of_items_per_page=5
    @page = params[:page] || 1
    @item_group = ItemGroup.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @item_group = ItemGroup.find(params[:id])
    @log = Log.create(description: "item  group edited " + @item_group.name, user: current_user )
    add_breadcrumb "Edit Item Group"
  end

  def update
    @item_group = ItemGroup.find(params[:id])
    @item_group.update(item_group_param)
    redirect_to @item_group
  end

  def destroy
    @item_group = ItemGroup.destroy(params[:id])
    @log = Log.create(description: "item group deleted " + @item_group.name, user: current_user )
    redirect_to @item_group
  end

  private
  def item_group_param
    params.require(:item_group).permit(:name, :parent_id, :description)
  end
end
