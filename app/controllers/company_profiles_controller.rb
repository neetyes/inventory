class CompanyProfilesController < ApplicationController
  add_breadcrumb "Company Profile", :company_profiles_path

  def new
      @company_profile = CompanyProfile.new

  end

  def create
    @company_profile =CompanyProfile.new(company_profile_param)
    @company_profile.logo_url = params[:file]
    if@company_profile.save
      redirect_to @company_profile
    else
      render 'new'
    end
  end

  def show
    @company_profile= CompanyProfile.find(params[:id])
  end

  def index
    @company_profiles =CompanyProfile.all
  end

  def edit
    @company_profile = CompanyProfile.find(params[:id])
    @log = Log.create(description: "Company profile edited" , user: current_user )
    add_breadcrumb "Edit Profile", :edit_company_profile_path
  end

  def update
    @company_profile = CompanyProfile.find(params[:id])
    @company_profile.update(company_profile_param)
    redirect_to @company_profile
  end

  def destroy
    @company_profile = CompanyProfile.destroy(params[:id])
    redirect_to @company_profile
  end

  private
  def company_profile_param
    params.require(:company_profile).permit(:name, :vdc_mun, :ward_no, :phone, :vat_pan_no, :logo_url, :district, :zone, :fiscal_year_id)
  end
end
