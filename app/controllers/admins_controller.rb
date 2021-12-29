class AdminsController < ApplicationController
  def show
    @admin = current_admin
    @users = User.joins(:company).where('company.status': 0)
                 .and(User.where(owner: true))
  end

  def companies_list
    @companies = Company.where.not(status: 0)
  end
end
