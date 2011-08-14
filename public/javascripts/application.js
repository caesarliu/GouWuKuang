// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	$('.delete_post').bind('ajax:success', function() { 
		$(this).closest('tr').fadeOut();  
	});
	
	//this class is used for all login on-demand links
	$('.login-link').facebox({  
	    loadingImage : '/images/loading.gif',  
		closeImage   : '/images/closelabel.png'
	});  

	$(document).bind('reveal.facebox', function() {  
	    $('#new_user_session').submit(function() {  
		    $.post(this.action, $(this).serialize(), null, "script");  
			return false;  
		});  
	}); 
				  
				   
});     


