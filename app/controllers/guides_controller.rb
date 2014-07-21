class GuidesController < InheritedResources::Base
	def add_detail
		@order = Guide.build	
		@ci = Time.now.to_i
		respond_with(@order, @ci)
	end

	def add_objeto
		#@cf = 'variable1'
		#@guide.items.build
		@guide = Guide.new
	  	respond_to do |format|
		  format.js
		end	
		
    	
	end

	def permitted_params
		params.permit!
	end
end
