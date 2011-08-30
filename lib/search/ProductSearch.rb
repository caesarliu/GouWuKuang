require "uri"
require "net/http"
require "iconv"
require "open-uri"
require "ruby-debug"
require "getoptlong"
require "ParamSection"

class ProductSearch
	def ProductSearch.get_params(product_name)

  puts "post form at Time : " + Time.new.inspect

keyword = Iconv.iconv("GB2312","UTF-8",product_name) 
params = {'q' => keyword}
x = Net::HTTP.post_form(URI.parse('http://ks.pconline.com.cn/index.jsp'), params)
#puts x.body

puts "get response of post at Time : " + Time.new.inspect
#using IGNORE to ignore non-gb2312 encoding string
content = Iconv.iconv("UTF-8//IGNORE","GB2312//IGNORE",x.body) 

=begin
if content.is_a?(String) == false
	puts content.class.name
	puts content.length
	puts content[1]
end
=end

hpContent = Hpricot(content[0])

#puts hpContent
#find url of the reivew params
params_url = nil
searchedEl = hpContent/"li.bigli"
searchedEl = searchedEl.at("table")/"a"
searchedEl.each { |a|
  if a.inner_html == '查看参数'
	 params_url = a["href"]
	 puts params_url
  end
}

puts "request param page at Time : " + Time.new.inspect
params_page = nil
params_page_utf8 = nil
if params_url
params_page = open(params_url)
params_page.rewind
params_page_utf8 = Iconv.iconv("UTF-8//IGNORE","GB2312//IGNORE",params_page.read)

end

puts "get response of param page at Time : " + Time.new.inspect

hp_param_page = Hpricot(params_page_utf8[0])
param_table = hp_param_page/"table.paramTable"
param_sections = Array.new
cur_section_name = nil
param_table.first.children.each { |node|
	if node.name == "thead"
	    if section_name = node.at("tr//th")
			cur_section_name = section_name.inner_text
			#puts 'current child: <thead>' + cur_section_name
	    end
	end
	
	if node.name == "tbody" && !(node.is_a?Hpricot::BogusETag)
		param_section = ParamSection.new
		param_section.section_name = cur_section_name
		
		node.children.each { |child|
		    
		    if child.name == "tr"
			    param_name = child.at("th")
			    param_content = child.at("td")
			    param_section.params << param_name.inner_text
		        param_section.params << param_content.inner_text
			    #puts (param_name.inner_text + ": " + param_content.inner_text).gsub("\n", "")
		    end
		}
		
		param_sections << param_section
		puts "======================================================================="
	end
	
	
} #param_table.first.children.each
  return param_sections
	end
end