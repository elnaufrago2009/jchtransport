class SenderAddressesController < InheritedResources::Base

	def index
		@sender_addresses = SenderAddress.where("sender_id = ?", params[:sender_id])
	end

	def permitted_params
		params.permit!
	end
end
