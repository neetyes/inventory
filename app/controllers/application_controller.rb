class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb "home", :root_path
  before_action :authenticate_user!
end
