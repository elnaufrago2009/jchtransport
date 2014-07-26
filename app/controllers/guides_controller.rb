class GuidesController < InheritedResources::Base
	def add_detail
		@order = Guide.build	
		@ci = Time.now.to_i
		respond_with(@order, @ci)
	end

	def show
		@guide = Guide.find(params[:id])
	    respond_to do |format|
	      format.html
	      format.pdf do
	        pdf = Prawn::Document.new
	        pdf.text "Hola mundo"
	        send_data pdf.render, type: "application/pdf", disposition: "inline"
	      end
    end
	end

	def permitted_params
		params.permit!
	end

	def guide_params
    	params.require(:guide).permit!
  	end
end
