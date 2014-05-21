class SessionsController < ApplicationController
  skip_before_filter :authenticate, only: [:login, :create, :destroy]
  skip_before_filter :user_agreed_rules?
  
  def login
    render layout: 'login'
  end
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end