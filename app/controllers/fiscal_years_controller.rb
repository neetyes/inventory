class FiscalYearsController < ApplicationController
  add_breadcrumb "Settings", :settings_index_path
  add_breadcrumb "Fiscal Year", :fiscal_years_path

  def new
    @fiscal_year = FiscalYear.new
    add_breadcrumb "Add Fiscal Year", :new_fiscal_year_path
  end

  def create
    @fiscal_year =FiscalYear.new(fiscal_year_param)
    if@fiscal_year.save
      @log = Log.create(description: "Added new Fiscal Year " +  @fiscal_year.name, user: current_user )
      redirect_to @fiscal_year
    else
      render 'new'
    end
  end

  def show
    @fiscal_year= FiscalYear.find(params[:id])
  end

  def index
    @fiscal_years =FiscalYear.all
    @number_of_items_per_page=5
    @page = params[:page] || 1
    @fiscal_years = FiscalYear.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @fiscal_year = FiscalYear.find(params[:id])
    @log = Log.create(description: "Fiscal Year edited " + @fiscal_year.name, user: current_user )
    add_breadcrumb "Edit Fiscal Year", :edit_fiscal_year_path
  end

  def update
    @fiscal_year = FiscalYear.find(params[:id])
    @fiscal_year.update(fiscal_year_param)
    redirect_to @fiscal_year
  end

  def destroy
    @fiscal_year = FiscalYear.destroy(params[:id])
    @log = Log.create(description: "Fiscal Year deleted " + @fiscal_year.name, user: current_user )
    redirect_to @fiscal_year
  end

  private
  def fiscal_year_param
    params.require(:fiscal_year).permit(:name, :start_date, :end_date)
  end
end
