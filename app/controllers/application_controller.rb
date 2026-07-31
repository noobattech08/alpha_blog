class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def logged_in?
    !!current_user # !! Converts the above current_user method to a boolean.
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # Memoization used here with ||(OR). If data is
    # already present then use that or else store the new instance user session. Used for optimization.
  end

  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end
end
