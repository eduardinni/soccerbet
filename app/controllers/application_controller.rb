class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate
  before_filter :user_agreed_rules?
  
  before_action :set_pools
  
  private
  
    def set_pools
      @my_pools = Pool.all
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
    def authenticate
      if current_user.nil?
        return redirect_to login_url, alert: t('flash.access_denied')
      else
        return redirect_to login_url, alert: t('flash.not_paid') unless current_user.paid?
      end
    end
    
    def user_agreed_rules?
      return redirect_to pages_rules_url, alert: t('flash.rules_not_agreed') unless current_user.rules_agreed?
    end
    
    def is_user_agreed_rules?
      if current_user.rules_agreed?
        return true
      end
      false
    end
    helper_method :is_user_agreed_rules?
    
    def authorize_admin
      unless current_user.role == 'admin'
        return redirect_to root_url, alert: t('flash.access_denied')
      end
    end
    
    def is_admin?
      if current_user.role == 'admin'
        return true
      end
      false
    end
    helper_method :is_admin?
end
