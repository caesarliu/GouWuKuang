require 'search/ProductSearch'

module LabHelper
  def printHello
	puts "hello LabHelper"
  end
  
  def search_params(product)
      return ProductSearch.get_params(product)
  end
end
