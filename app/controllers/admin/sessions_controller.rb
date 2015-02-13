class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.admin?
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to admin_root_url
    else if !user.admin?
      flash.now[:danger] = "You do not have permission to login" 
      else
        flash.now[:danger] = "Invalid email/password combination"
      end
      render 'admin/sessions/new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_root_url
  end
end