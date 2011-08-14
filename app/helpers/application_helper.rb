module ApplicationHelper

def auth_link_to(body, url_options = {}, html_options = {})
    if session[:user]
        link_to body, url_options, html_options
	else
	    dest_url = url_options[:controller] + "/" + url_options[:action]
	    link_to body, {:controller => "sessions", :action => "new", :dest=>dest_url}, :class => 'login-link'
	end
end

end
