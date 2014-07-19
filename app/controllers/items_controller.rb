class ItemsController < InheritedResources::Base
	def permitted_params
		params.permit!
	end
end
