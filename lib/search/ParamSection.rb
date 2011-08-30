class ParamSection
    attr_accessor :section_name
	attr_accessor :params
	def initialize
	    @section_name = nil
		@params = Array.new
	end
end