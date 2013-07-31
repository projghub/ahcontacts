class Admin::AdminController < ApplicationController
  layout 'admin/index'
  before_filter :authenticate_user
  before_filter :authorize_user

  def index
    redirect_to admin_login_path, notice: 'Please sign in'
  end

  def dashboard
  end

private
  def authorize_user
    unless current_permission.allow?(admin_current_user, :admin, params[:controller], params[:action])
      redirect_to admin_dashboard_path, alert: 'Not authorized'
    end
  end

  def authenticate_user
    if admin_current_user.nil?
      redirect_to admin_login_path, notice: 'Please sign in' and return
    end
  end
end
