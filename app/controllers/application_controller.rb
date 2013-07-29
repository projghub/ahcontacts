class ApplicationController < ActionController::Base
  protect_from_forgery

  delegate :allow?, to: :current_permission
  helper_method :allow?

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end
private
  def admin_current_user
    @admin_current_user ||= User.find(session[:admin_user_id]) if session[:admin_user_id]
  end
  helper_method :admin_current_user

  def advertiser_current_user
    @advertiser_current_user ||= User.find(session[:advertiser_user_id]) if session[:advertiser_user_id]
  end
  helper_method :advertiser_current_user

  def current_permission
    @current_permission ||= Permission.new
  end

  def render_404(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500(exception)
    @error = exception
    @controller = params[:controller]
    @action = params[:action]
    respond_to do |format|
      format.html { render template: 'errors/error_500', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500 }
    end
  end
end
