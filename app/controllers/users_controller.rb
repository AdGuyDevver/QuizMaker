class UsersController < ApplicationController

  layout "admin"
  before_action :check_session, :except =>[:new]

  def index
    @users = User.sorted
    redirect_to root_url if current_user.nil?
  end

  def new
    @user = User.new
  end

  def show
     @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "User created successfully."
      log_in @user
      redirect_to @user
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:notice] = "Oops! Something went wrong. Please try again."
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "User updated successfully."
      redirect_to @user
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User destroyed successfully."
    redirect_to users_path
  end

  private

    def user_params
      # same as using "params[:user]", except that it:
      # - raises an error if :user is not present
      # - allows listed attributes to be mass-assigned
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :is_admin, :is_super_admin, :id)
    end

end
