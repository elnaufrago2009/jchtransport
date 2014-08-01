class GuidesController < ApplicationController
  #before_action :set_guide, only: [:show, :edit, :update, :destroy]

  def add_detail
		@order = Guide.build	
		@ci = Time.now.to_i
		respond_with(@order, @ci)
  end

  # GET /guides
  # GET /guides.json
  def index
    @guides = Guide.where('numero_remision_guia LIKE ?', "%#{params[:q]}%").paginate(:page => params[:page], :per_page => 10).order('id Desc')    
    
  end

  # GET /guides/1
  # GET /guides/1.json
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

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
    @guide = Guide.find(params[:id])
  end

  # POST /guides
  # POST /guides.json
  def create
  	number_guide = NumberGuide.last		
    number_guide.update numero: "#{params[:guide][:numero_remision_guia]}"
    @guide = Guide.new(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1
  # PATCH/PUT /guides/1.json
  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url, notice: 'Guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_guide
    #  @guide = Guide.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def guide_params
    #  params.require(:guide).permit!
    #end

    def permitted_params
    	params.permit!
    end

    def guide_params
    	params.require(:guide).permit!
  	end

  	def number_guide_params
  		params.require(:number_guide).permit!
  	end

end