require 'search/ProductSearch'

module LabHelper
  #add this line to reload lib for every request
  require_dependency 'search/ProductSearch'
  def printHello
	puts "hello LabHelper"
  end
  
  def search_params(product)
      return ProductSearch.get_params(product)
  end
end
