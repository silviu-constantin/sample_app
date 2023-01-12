class ApplicationController < ActionController::Base
  include SessionsHelper

  def is_owner restaurant
    unless current_user.owner == restaurant
      store_location
      flash[:danger] = "You are not an administrator for this restaurant."
      redirect_to root_path
    end
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
