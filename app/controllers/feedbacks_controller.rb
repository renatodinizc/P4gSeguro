class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params.require(:feedback).permit(:body))
    @feedback.company = Company.find(params[:company_id])
    if @feedback.save
      @feedback.company.approved!
      redirect_to admin_path current_admin
    else
      render :new
    end
  end
end
