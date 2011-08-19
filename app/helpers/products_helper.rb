module ProductsHelper
  def join_tags(post)
    product.tags.map {|t| t.name }.join(",")
  end
end
