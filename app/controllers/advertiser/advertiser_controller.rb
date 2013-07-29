class Advertiser::AdvertiserController < ApplicationController
  layout 'advertiser/index'
  before_filter :authenticate_user
  before_filter :authorize_user

  def index
    redirect_to advertiser_login_path, notice: 'Please sign in'
  end

  def dashboard
  end

  def whitelist_advertiser_permissions(permissions, whitelist_keys)
    permissions.map! { |p| p if whitelist_keys.include?(p.to_i) }.compact!
  end

  def help
  end

private
  def authorize_user
    unless current_permission.allow?(advertiser_current_user, :advertiser, params[:controller], params[:action])
      redirect_to advertiser_dashboard_path, alert: 'Not authorized'
    end
  end

  def authenticate_user
    if advertiser_current_user.nil?
      redirect_to advertiser_login_path, notice: 'Please sign in' and return
    end
  end
end
