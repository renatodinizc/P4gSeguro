class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    root_path if resource.is_a? Admin
    if resource.valid?(:has_company?)
      root_path
    else
      new_company_path
    end
  end
end
