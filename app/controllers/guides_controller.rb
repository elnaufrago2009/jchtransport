class GuidesController < ApplicationController

  #before_action :set_guide, only: [:show, :edit, :update, :destroy]

  def anular_guide
    guide = Guide.find(params[:id])
    guide.update estado: 1
    redirect_to "/guides/#{params[:id]}", notice: "Guia de Remision anulada correctamente!"
  end

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

          # Fecha de emision
          pdf.draw_text "#{@guide.fecha_emision}", :at => [45,628], size: '10'

          # Fecha de Translado
          pdf.draw_text "#{@guide.fecha_inicio_traslado}", :at => [230,628], size: '10'

          

          ###################### Direccion de partida ################################
          pdf.draw_text "#{@guide.partida_direccion}", :at => [50,590], size: '10'
          pdf.draw_text "#{@guide.partida_district.nombre}", :at => [50,575], size: '10'
          pdf.draw_text "#{@guide.partida_province.nombre}", :at => [40,560], size: '10'
          pdf.draw_text "#{@guide.llegada_department.nombre}", :at => [175,560], size: '10'


          ###################### Direccion de llegada ################################
          pdf.draw_text "#{@guide.llegada_direccion}", :at => [350,590], size: '10'
          pdf.draw_text "#{@guide.llegada_district.nombre}", :at => [350,575], size: '10'
          pdf.draw_text "#{@guide.llegada_province.nombre}", :at => [340,560], size: '10'
          pdf.draw_text "#{@guide.llegada_department.nombre}", :at => [470,560], size: '10'


          ############################### Remitente #########################################
          pdf.draw_text "#{@guide.sender.name_reason}", :at => [5,510], size: '10'
          pdf.draw_text "#{@guide.sender.ruc}", :at => [25,495], size: '10'
          pdf.draw_text "#{ @guide.sender.identity_document}", :at => [175,485], size: '10'

          ############################### Destinatario ######################################
          pdf.draw_text "#{@guide.addressee.name_reason}", :at => [295,510], size: '10'
          pdf.draw_text "#{@guide.addressee.ruc}", :at => [315,495], size: '10'
          pdf.draw_text "#{@guide.addressee.identity_document}", :at => [455,485], size: '10'


          ############################### Descripciones #####################################
          abajo = 415         
          @guide.items.each do |item|
            pdf.draw_text "#{item.codigo}", :at => [20,abajo], size: '10'
            pdf.draw_text "#{item.descripcion}", :at => [80,abajo], size: '10'
            pdf.draw_text "#{item.cantidad}", :at => [420,abajo], size: '10'
            pdf.draw_text "#{item.measure.nombre}", :at => [470,abajo], size: '10'
            pdf.draw_text "#{item.peso}", :at => [530,abajo], size: '10'
            pdf.draw_text "#{item.unit.und}", :at => [550,abajo], size: '10'
            abajo = abajo - 15
          end


          ####################### datos de Identificacion de transporte y conductor ###########
          pdf.draw_text "#{@guide.unidad_marca_vehiculo}", :at => [88,60], size: '10'
          pdf.draw_text "#{@guide.front.nombre}", :at => [50,45], size: '10'
          pdf.draw_text "#{@guide.back.nombre}", :at => [95,45], size: '10'
          pdf.draw_text "#{@guide.unidad_configuracion_vehicular}", :at => [112,30], size: '10'
          pdf.draw_text "#{@guide.conductor_certificado_inscripcion}", :at => [132,15], size: '10'
          pdf.draw_text "#{@guide.conductor_licencia_conducir}", :at => [113,0], size: '10'

          ######################  datos de la empresa #########################################
          pdf.draw_text "#{@guide.empresa_subcontratada_nombre_apellido_razon_social}", :at => [215, 35], size: '10'
          pdf.draw_text "#{@guide.empresa_subcontratada_ruc}", :at => [240,0], size: '10'

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
        format.html { redirect_to @guide, notice: 'Guia de Remision Creada correctamente.' }
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