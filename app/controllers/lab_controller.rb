class LabController < ApplicationController
  include LabHelper

  skip_before_filter :authorize
  def index
  end

  def search
    @product_name = params[:product]
	@param_sections = search_params(@product_name)
	
    respond_to do |format|
      format.html 
    end
  end
end
