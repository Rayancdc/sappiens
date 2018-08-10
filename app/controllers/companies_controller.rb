class CompaniesController < ApplicationController
  def new
  	@company = Company.new
  end

  def create
  	@company = Company.new(company_params)
  	@company.user = current_user
  	if @company.save
  		redirect_to dashboard_users_path(current_user)
  	else
  		render :new
  	end
  end

  private

  def company_params
  	params.require(:company).permit(:address_id, :name)
  end

end
