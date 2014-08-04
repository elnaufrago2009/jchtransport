$(document).ready(function(){
		var numero = $("#factura_numero").val();
        var nombres = $("#factura_nombres").val();
        var fecha = $("#factura_fecha").val();
        var ruc = $("#factura_ruc").val();
        var direccion = $("#factura_direccion").val();
        var guide_id = $("#factura_guide_id").val();
        var credito_id = $("#factura_credito_id").val();
        var banco = $("#factura_banco").val();
        var valor_venta = $("#factura_valor_venta").val();
        var igv = $("#factura_igv").val();
        var precio_venta = $("#factura_precio_venta").val();
        var numero_cheque = $("#factura_numero_cheque").val();
        var cancelado_fecha = $("#factura_cancelado_fecha").val();
		if (numero != ''){ $('#numero').addClass('has-success'); } else { $('#numero').removeClass('has-success'); }
        if (nombres != ''){ $('#nombres').addClass('has-success'); } else { $('#nombres').removeClass('has-success'); }
        if (fecha != ''){ $('#fecha').addClass('has-success'); } else { $('#fecha').removeClass('has-success'); }
        if (ruc != ''){ $('#ruc').addClass('has-success'); } else { $('#ruc').removeClass('has-success'); }
        if (direccion != ''){ $('#direccion').addClass('has-success'); } else { $('#direccion').removeClass('has-success'); }
        if (guide_id != ''){ $('#guide_id').addClass('has-success'); } else { $('#guide_id').removeClass('has-success'); }
        if (credito_id != ''){ $('#credito_id').addClass('has-success'); } else { $('#credito_id').removeClass('has-success'); }
        if (banco != ''){ $('#banco').addClass('has-success'); } else { $('#banco').removeClass('has-success'); }        
        if (valor_venta != ''){ $('#valor_venta').addClass('has-success'); } else { $('#valor_venta').removeClass('has-success'); }        
        if (igv != ''){ $('#igv').addClass('has-success'); } else { $('#igv').removeClass('has-success'); }        
        if (precio_venta != ''){ $('#precio_venta').addClass('has-success'); } else { $('#precio_venta').removeClass('has-success'); }        
        if (numero_cheque != ''){ $('#numero_cheque').addClass('has-success'); } else { $('#numero_cheque').removeClass('has-success'); }
        if (cancelado_fecha != ''){ $('#cancelado_fecha').addClass('has-success'); } else { $('#cancelado_fecha').removeClass('has-success'); }
        	
    $("#factura_numero, #factura_nombres, #factura_fecha, #factura_ruc, #factura_direccion, #factura_guide_id, #factura_credito_id, #factura_valor_venta, #factura_igv, #factura_precio_venta, #factura_banco, #factura_numero_cheque, #factura_cancelado_fecha").change(function(event){
        var numero = $("#factura_numero").val();
        var nombres = $("#factura_nombres").val();
        var fecha = $("#factura_fecha").val();
        var ruc = $("#factura_ruc").val();
        var direccion = $("#factura_direccion").val();
        var guide_id = $("#factura_guide_id").val();
        var credito_id = $("#factura_credito_id").val();
        var banco = $("#factura_banco").val();
        var valor_venta = $("#factura_valor_venta").val();
        var igv = $("#factura_igv").val();
        var precio_venta = $("#factura_precio_venta").val();
        var numero_cheque = $("#factura_numero_cheque").val();
        var cancelado_fecha = $("#factura_cancelado_fecha").val();

        if (numero != ''){ $('#numero').addClass('has-success'); } else { $('#numero').removeClass('has-success'); }
        if (nombres != ''){ $('#nombres').addClass('has-success'); } else { $('#nombres').removeClass('has-success'); }
        if (fecha != ''){ $('#fecha').addClass('has-success'); } else { $('#fecha').removeClass('has-success'); }
        if (ruc != ''){ $('#ruc').addClass('has-success'); } else { $('#ruc').removeClass('has-success'); }
        if (direccion != ''){ $('#direccion').addClass('has-success'); } else { $('#direccion').removeClass('has-success'); }
        if (guide_id != ''){ $('#guide_id').addClass('has-success'); } else { $('#guide_id').removeClass('has-success'); }
        if (credito_id != ''){ $('#credito_id').addClass('has-success'); } else { $('#credito_id').removeClass('has-success'); }
        if (banco != ''){ $('#banco').addClass('has-success'); } else { $('#banco').removeClass('has-success'); }        
        if (valor_venta != ''){ $('#valor_venta').addClass('has-success'); } else { $('#valor_venta').removeClass('has-success'); }        
        if (igv != ''){ $('#igv').addClass('has-success'); } else { $('#igv').removeClass('has-success'); }        
        if (precio_venta != ''){ $('#precio_venta').addClass('has-success'); } else { $('#precio_venta').removeClass('has-success'); }        
        if (numero_cheque != ''){ $('#numero_cheque').addClass('has-success'); } else { $('#numero_cheque').removeClass('has-success'); }
        if (cancelado_fecha != ''){ $('#cancelado_fecha').addClass('has-success'); } else { $('#cancelado_fecha').removeClass('has-success'); }
        
    });

    

});

$(document).ready(function(){
    $("#partidasdecontrol_sectore_id").change(function(event){
        var id = $("#partidasdecontrol_sectore_id").find(':selected').val();
        $("#partidasdecontrol_subsectore_id").load('/partidasdecontrols/mostrar/'+id);
    });
});

