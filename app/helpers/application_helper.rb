module ApplicationHelper

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    return true if !current_user.nil?
  end

  def authorize # duplicated by check_session method below
    redirect_to '/login' unless current_user
  end

  def clear_my_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def check_session
    redirect_to root_path unless current_user
  end

end
