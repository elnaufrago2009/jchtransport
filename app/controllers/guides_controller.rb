class GuidesController < InheritedResources::Base
	def add_detail
		@order = Guide.build	
		@ci = Time.now.to_i
		respond_with(@order, @ci)
	end
	def permitted_params
		params.permit!
	end
end
