require "uri"
require "net/http"
require "rubygems"
require "iconv"
require "open-uri"
require "ruby-debug"
require "hpricot"

def parse_products_table(ptable_page_url)
    puts "request product table page at Time : " + Time.new.inspect
    ptable_page = open(ptable_page_url)
    ptable_page.rewind
    ptable_page_utf8 = Iconv.iconv("UTF-8//IGNORE","GB2312//IGNORE",ptable_page.read)
	puts "get response of product table page at Time : " + Time.new.inspect
	
	hp_ptable_page = Hpricot(ptable_page_utf8[0])
	#get products
	product_list = hp_ptable_page/"ul.product-list//li"
	product_list.each do |product|
	    product_name = product.at("a.name")
		if product_name
		    puts product_name.inner_text
		end
	end
	
	turn_page_el =  (hp_ptable_page/"p.turn-page").at("a.next")
	next_page_url = nil
	if turn_page_el
	p next_page_url = "http://product.pconline.com.cn" + turn_page_el["href"]
	end

	return next_page_url
	
end

def parse_brand_page(brand_page_url)
    puts "request brand page at Time : " + Time.new.inspect
    brand_page = open(brand_page_url)
    brand_page.rewind
    brand_page_utf8 = Iconv.iconv("UTF-8//IGNORE","GB2312//IGNORE",brand_page.read)
	puts "get response of brand page at Time : " + Time.new.inspect
	
	hp_brand_page = Hpricot(brand_page_utf8[0])
	total_num = (hp_brand_page/"#J-number")
	#test = total_num.at("div.hadWap")
	puts total_num.inner_text
	
	product_list = hp_brand_page/"ul.product-list//li"
	product_list.each do |product|
	    product_name = product.at("a.name")
		#puts product_name
		if product_name
		    puts product_name.inner_text
		end
	end
	# analyze page and return next page url
	turn_page_el = (hp_brand_page/"p.turn-page").at("a.next")
	
	next_page_url = nil
	if turn_page_el
	p next_page_url = "http://product.pconline.com.cn" + turn_page_el["href"]
	end
	# go over next pages and get all products
	while(next_page_url) do 
	    p next_page_url = parse_products_table(next_page_url)
	end
	puts "=================================================="
end

mobiles_page = nil
mobiles_page_utf8 = nil

puts "request mobiles page at Time : " + Time.new.inspect
mobiles_page = open("http://product.pconline.com.cn/mobile/")
mobiles_page.rewind
mobiles_page_utf8 = Iconv.iconv("UTF-8//IGNORE","GB2312//IGNORE",mobiles_page.read)
puts "get response of mobiles page at Time : " + Time.new.inspect

hp_mobiles_page = Hpricot(mobiles_page_utf8[0])
mobile_brands = hp_mobiles_page/"div#J-defaultBrand1//dl//dd//i"
mobile_brands.each do |brand|
    puts brand.inner_text
	puts brand_page_url = "http://product.pconline.com.cn" + brand.at("a")["href"]
	parse_brand_page(brand_page_url)
	
end




