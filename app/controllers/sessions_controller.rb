class SessionsController < ApplicationController
# see also SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      flash[:notice] = "Log in Successful. Welcome back #{current_user.username}"
      redirect_to current_user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    clear_my_cache
    flash[:notice] = "Logout successful"
    redirect_to root_url # instead, use 'goodbye' ?
  end


end
