class SessionsController < ApplicationController
  skip_before_filter :authorize
  layout :choose_layout
  
  def new
      session[:previous_url] = request.referer
	  #in login on demand case, the destination url need to store before login process
	  if params[:dest]
	    session[:previous_url] = params[:dest]
	  end
	  p session[:previous_url]
	  
  end

  def create
  
	if user = User.authenticate(params[:name], params[:password])
        #session is stored for each client
		session[:user] = user
		
		#check if need to save login
		if params[:remember_me] == "1"
		  user.remember_me
          cookies[:auth_token] = { :value => user.remember_token , :expires => user.remember_token_expires }
		end
	    
		p "redirect to " + session[:previous_url]
		
		respond_to do |format|
		  format.html { redirect_to session[:previous_url] }  
          format.js { render :redirect } # JavaScript to do the redirect
		end
	else
		#redirect_to login_url, :alert => "无效的用户名或密码";
		
		p "invalid user name or password"
		#p escape_JavaScript(render :new)
	    respond_to do |format|
		  format.html {render :new}
		  format.js # create.js.erb
		  p format.to_s
		end
	end
  end

  def destroy
	session[:user].forget_me if session[:user]
    session[:user] = nil
    cookies.delete :auth_token
	redirect_to login_url, :notice => "已登出"
  end
  
  private
  def choose_layout
	(request.xhr?) ? nil : 'application'
  end

end
