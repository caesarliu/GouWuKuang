class DefaultController < ApplicationController
  def index
	@products = Product.all
  end

end
