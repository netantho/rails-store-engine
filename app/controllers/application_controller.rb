class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :choose_layout

  protected
    def choose_layout
      "_public"
    end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  
  def require_login_user
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
  
  def require_login_admin
    unless current_user && current_user.role == 'admin'
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_url # halts request cycle
    end
  end

  def categories
    Category.all
  end
  
  def current_admin?
    current_user.role == "admin" unless current_user.nil?
  end

  helper_method :current_user
  helper_method :categories
  helper_method :current_admin?
end