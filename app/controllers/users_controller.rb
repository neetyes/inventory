class UsersController < ApplicationController
  add_breadcrumb "Settings", :settings_index_path
  add_breadcrumb "User", :users_path
  def new
    @user = User.new
    add_breadcrumb "New user", :new_user_path
  end

  def create
    @user =User.new(user_param)
    if@user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users =User.all
    @number_of_items_per_page=5
    @page = params[:page] || 1
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  private
  def user_param
    params.require(:unit).permit(:email)
  end
end
