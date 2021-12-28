class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params.require(:company)
                                 .permit(:name, :cnpj,
                                         :billing_address, :billing_email))
    if @company.save
      current_user.update(company: @company)
      current_user.update(owner: true)
      redirect_to user_path current_user
    else
      render :new
    end
  end
end
