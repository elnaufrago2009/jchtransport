class FacturasController < ApplicationController
  #before_action :set_factura, only: [:show, :edit, :update, :destroy]

  # GET /facturas
  # GET /facturas.json
  def index
    @facturas = Factura.where('numero LIKE ?', "%#{params[:q]}%").paginate(:page => params[:page], :per_page => 10).order('id Desc')        
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show  	
  	@factura = Factura.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new

        ####################### datos generales ###########################
        pdf.draw_text "#{@factura.fecha.strftime("%d")}", :at => [475,630], size: '10'
        pdf.draw_text "#{@factura.fecha.strftime("%m")}", :at => [500,630], size: '10'
        pdf.draw_text "#{@factura.fecha.strftime("%Y")}", :at => [530,630], size: '10'
        pdf.draw_text "#{@factura.sender_address.sender.name_reason}", :at => [70,630], size: '10'
        pdf.draw_text "#{@factura.sender_address.sender.ruc}", :at => [45,608], size: '10'
        pdf.draw_text "#{@factura.sender_address.direccion}", :at => [240,608], size: '10'
        if !@factura.guide.try(:numero_remision_guia).blank?
          pdf.draw_text "508 - #{@factura.guide.try(:numero_remision_guia)}", :at => [490,610], size: '10'
        end
        
        pdf.draw_text "#{@factura.credito.try(:nombre)}", :at => [118,592], size: '10'

        ####################### Glosas ######################################
        altura = 540
        @factura.elementos.each do |elemento|
          pdf.draw_text "#{elemento.cantidad}", :at => [25,altura]


          if !elemento.guide_id.blank?
            pdf.draw_text "506 - #{elemento.guide.numero_remision_guia}", :at => [60,altura], size: '10'
            pdf.draw_text "#{elemento.descripcion}", :at => [120,altura], size: '10'
          elsif 
            pdf.draw_text "Cod: #{elemento.item.codigo} Descp: #{elemento.item.descripcion} Cant: #{elemento.item.cantidad} #{elemento.item.measure.nombre} Peso: #{elemento.item.peso} #{elemento.item.unit.und}, elemento.descripcion", :at => [60,altura], size: '10'
          end


          pdf.draw_text "#{elemento.precio_unitario}", :at => [415,altura], size: '10'
          pdf.draw_text "#{elemento.precio_venta}", :at => [480,altura], size: '10'
          pdf.draw_text "#{@factura.moneda.simbolo}", :at => [509,altura], size: '10'
          altura = altura - 15
        end
      
        parts = @factura.precio_venta.to_s.split(".")
        result = parts.count > 1 ? parts[0].to_s : 0
        decimal = parts[1]

        pdf.draw_text "SON: #{I18n.with_locale(:es) { result.to_i.to_words.upcase }} COM #{decimal}/100 NUEVOS SOLES", :at => [60,250], size: '10'

        pdf.draw_text "#{@factura.valor_venta}", :at => [500,185], size: '10'
        pdf.draw_text "#{@factura.igv}", :at => [500,165], size: '10'
        pdf.draw_text "#{@factura.precio_venta}", :at => [500,145], size: '10'
        

        if @factura.efectivo == true
          pdf.draw_text "X", :at => [75,185], size: '10'          
        end
        
        if @factura.cheque == true
          pdf.draw_text "X", :at => [138,185], size: '10'
        end
        
        pdf.draw_text "#{@factura.try(:banco)}", :at => [60,172], size: '10'
        pdf.draw_text "#{@factura.try(:numero_cheque)}", :at => [80,155], size: '10'

        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /facturas/new
  def new
    @factura = Factura.new
  end

  # GET /facturas/1/edit
  def edit
  end

  # POST /facturas
  # POST /facturas.json
  def create
  	# actualiza el contador de numero de factura
  	number_invoice = NumberInvoice.last
    number_invoice.update number: "#{params[:factura][:numero]}"


    @factura = Factura.new(factura_params)

    respond_to do |format|
      if @factura.save
        if params[:factura][:guide_id] != ''
          number_guide = Guide.find_by_id(params[:factura][:guide_id])
          number_guide.update facturado: 1 
        else
          if params[:factura][:elementos_attributes]['0'][:guide_id] != ''
            number_guide = Guide.find_by_id(params[:factura][:elementos_attributes]['0'][:guide_id])
            number_guide.update facturado: 1 
          end
          if params[:factura][:elementos_attributes]['1'][:guide_id] != ''
            number_guide = Guide.find_by_id(params[:factura][:elementos_attributes]['1'][:guide_id])
            number_guide.update facturado: 1 
          end
          if params[:factura][:elementos_attributes]['2'][:guide_id] != ''
            number_guide = Guide.find_by_id(params[:factura][:elementos_attributes]['2'][:guide_id])
            number_guide.update facturado: 1 
          end
          if params[:factura][:elementos_attributes]['3'][:guide_id] != ''
            number_guide = Guide.find_by_id(params[:factura][:elementos_attributes]['3'][:guide_id])
            number_guide.update facturado: 1 
          end
          if params[:factura][:elementos_attributes]['4'][:guide_id] != ''
            number_guide = Guide.find_by_id(params[:factura][:elementos_attributes]['4'][:guide_id])
            number_guide.update facturado: 1 
          end
          if params[:factura][:elementos_attributes]['5'][:guide_id] != ''
            number_guide = Guide.find_by_id(params[:factura][:elementos_attributes]['5'][:guide_id])
            number_guide.update facturado: 1 
          end
          if params[:factura][:elementos_attributes]['6'][:guide_id] != ''
            number_guide = Guide.find_by_id(params[:factura][:elementos_attributes]['6'][:guide_id])
            number_guide.update facturado: 1 
          end
        end
        format.html { redirect_to @factura, notice: 'Factura was successfully created.' }
        format.json { render :show, status: :created, location: @factura }
      else
        format.html { render :new }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json

  def anular_factura
    factura = Factura.find(params[:id])
    if !factura.guide_id.blank?
      guide = Guide.find_by_id(factura.guide_id)
      guide.update facturado: 0
    else
      elementos = Elemento.where(:factura_id => factura.id)
      elementos.each do |elemento|
        guide = Guide.find_by_id(elemento.guide_id)
        guide.update facturado: 0
      end
    end

    factura.update estado: 1
    
    redirect_to "/facturas/#{params[:id]}", notice: "Factura anulada correctamente!"
  end

  def update
    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to @factura, notice: 'Factura was successfully updated.' }
        format.json { render :show, status: :ok, location: @factura }
      else
        format.html { render :edit }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    @factura.destroy
    respond_to do |format|
      format.html { redirect_to facturas_url, notice: 'Factura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


	def values_guia_remision
		if params[:id] == ''
			@parser = '0'
		else
			@parser = '1'
			@guides = Guide.where(:sender_id => params[:id], :estado => 0, :facturado => 0)	
		end

	    respond_to do |format|
	      format.html {render :layout => 'select'}
	    end
	end  

  def values_factura_guia_id
		if params[:id] == ''
			@parser = '0'
		else
			@parser = '1'
			@guides = Guide.where(:sender_id => params[:id], :estado => 0, :facturado => 0)	
		end

	    respond_to do |format|
	      format.html {render :layout => 'select'}
	    end
	end

	def values_item_guia
		if params[:id] == ''
			@parser = '0'
		else
			@parser = '1'			
			@items = Item.where(:guide_id => params[:id])
		end

		#@items = Item.where(:guide_id => params[:id])
	    respond_to do |format|
	      format.html {render :layout => 'select'}
	    end
	end

	def permitted_params
		params.permit!
	end





  # Never trust parameters from the scary internet, only allow the white list through.
  def factura_params
    params.require(:factura).permit!
  end

end
