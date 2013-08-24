class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def login_required
    if !user_signed_in?
      redirect_to '/'
    end
  end
    
end
