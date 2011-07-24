class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
	  puts login_url
      redirect_to login_url, :notice => "请登录"
	end
  end
end
