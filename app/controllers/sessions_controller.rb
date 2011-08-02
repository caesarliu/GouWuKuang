class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
      session[:previous_url] = request.referer
	  p session[:previous_url]
  end

  def create
	if user = User.authenticate(params[:name], params[:password])
		session[:user] = user
		
		#check if need to save login
		if params[:remember_me] == "1"
		  user.remember_me
          cookies[:auth_token] = { :value => user.remember_token , :expires => user.remember_token_expires }
		end
	
		p "redirect to " + session[:previous_url]
		redirect_to session[:previous_url]
		
	else
		redirect_to login_url, :alert => "无效的用户名或密码";
	end
  end

  def destroy
	session[:user].forget_me if session[:user]
    session[:user] = nil
    cookies.delete :auth_token
	redirect_to login_url, :notice => "已登出"
  end

end
