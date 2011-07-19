class DefaultController < ApplicationController
  skip_before_filter :authorize
  def index
	@products = Product.all
  end

end
