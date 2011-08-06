// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
				  /*
				  $("a").click(function() {
							   alert("Hello world!");
							   });
				   */
				  $('.delete_post').bind('ajax:success', function() { 
										 $(this).closest('tr').fadeOut();  
										 });  
						});     


