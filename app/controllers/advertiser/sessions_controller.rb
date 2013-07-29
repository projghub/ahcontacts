class Advertiser::SessionsController < ApplicationController
  layout 'advertiser/index'

  def new
    redirect_to advertiser_dashboard_path, notice: 'You are already logged in' if advertiser_current_user
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:advertiser_user_id] = user.id
      redirect_to advertiser_dashboard_path, notice: "Logged In"
    else
      flash.now[:error] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:advertiser_user_id] = nil
    redirect_to advertiser_login_path, notice: "Logged out"
  end
end
