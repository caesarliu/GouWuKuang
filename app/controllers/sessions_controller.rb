class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
	if user = User.authenticate(params[:name], params[:password])
		session[:user_id] = user.id
		session[:user_name] = user.name
		redirect_to request.referer
	else
		redirect_to login_url, :alert => "无效的用户名或密码";
	end
  end

  def destroy
    session[:user_id] = nil
	session[:user_name]  = nil
	redirect_to login_url, :notice => "已登出"
  end

end
