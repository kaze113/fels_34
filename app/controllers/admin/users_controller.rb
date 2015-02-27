class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @users = User.paginate page: params[:page]
  end 

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end

  private

    def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
    end

end
