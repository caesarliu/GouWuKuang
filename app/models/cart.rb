class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
 def add_product(product_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
    current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id=>product_id)
      line_items << current_item
    end
    current_item
  end
  
end
