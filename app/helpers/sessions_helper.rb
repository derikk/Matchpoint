module SessionsHelper
  # Returns the current logged-in user (if any).
  def current_user
    if session[:uid]
      @current_user ||= User.find_by(uid: session[:uid])
    end
  end

  # Returns true if the user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Redirect to login form if not authenticated
  def authenticate_user!
    logged_in? || redirect_to(login_path)
  end
end
