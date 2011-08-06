class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :login_from_cookie
  
  protect_from_forgery
  
protected
  
  def authorize
    unless session[:user] && User.find_by_id(session[:user].id)
      redirect_to login_url, :notice => "请登录"
	end
  end
  
   def login_from_cookie
      return unless cookies[:auth_token] && session[:user].nil?
      user = User.find_by_remember_token(cookies[:auth_token]) 
	  if user && !user.remember_token_expires.nil? && Time.now < user.remember_token_expires 
		    session[:user] = user
      end
   end
   
end
