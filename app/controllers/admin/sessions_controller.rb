class Admin::SessionsController < ApplicationController
  layout 'admin/index'

  def new
    redirect_to admin_dashboard_path, notice: 'You are already logged in' if admin_current_user
  end

  def create
    user = User.admin_namespace.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:admin_user_id] = user.id
      redirect_to admin_dashboard_path, notice: "Logged In"
    else
      flash.now[:error] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to admin_login_path, notice: "Logged out"
  end
end
