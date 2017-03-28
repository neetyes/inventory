class LogsController < ApplicationController
  add_breadcrumb "Settings", :settings_index_path
  add_breadcrumb "Logs", :logs_path

  def index
    @logs =Log.all
    @number_of_logs_per_page=5
    @page = params[:page] || 1
    @log = Log.paginate(:page => params[:page], :per_page => 5)
  end

  private
  def log_param
    params.require(:log).permit(:user_id, :description)
  end
end
