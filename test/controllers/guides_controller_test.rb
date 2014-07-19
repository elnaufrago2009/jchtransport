require 'test_helper'

class GuidesControllerTest < ActionController::TestCase
  setup do
    @guide = guides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guide" do
    assert_difference('Guide.count') do
      post :create, guide: { conductor_certificado_inscripcion: @guide.conductor_certificado_inscripcion, conductor_licencia_conducir: @guide.conductor_licencia_conducir, destinatario_apellido_nombre_razon_social: @guide.destinatario_apellido_nombre_razon_social, destinatario_dni: @guide.destinatario_dni, destinatario_ruc: @guide.destinatario_ruc, empresa_subcontratada_nombre_apellido_razon_social: @guide.empresa_subcontratada_nombre_apellido_razon_social, empresa_subcontratada_ruc: @guide.empresa_subcontratada_ruc, fecha_emision: @guide.fecha_emision, fecha_inicio_traslado: @guide.fecha_inicio_traslado, llegada_department_id: @guide.llegada_department_id, llegada_direccion: @guide.llegada_direccion, llegada_district_id: @guide.llegada_district_id, llegada_province_id: @guide.llegada_province_id, numero_remision_guia: @guide.numero_remision_guia, obsevaciones: @guide.obsevaciones, partida_department_id: @guide.partida_department_id, partida_direccion: @guide.partida_direccion, partida_district_id: @guide.partida_district_id, partida_province_id: @guide.partida_province_id, remitente_apellido_nombre_razon_social: @guide.remitente_apellido_nombre_razon_social, remitente_dni: @guide.remitente_dni, remitente_ruc: @guide.remitente_ruc, unidad_configuracion_vehicular: @guide.unidad_configuracion_vehicular, unidad_marca_vehiculo: @guide.unidad_marca_vehiculo, unidad_placa_delantera: @guide.unidad_placa_delantera, unidad_placa_trasera: @guide.unidad_placa_trasera }
    end

    assert_redirected_to guide_path(assigns(:guide))
  end

  test "should show guide" do
    get :show, id: @guide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guide
    assert_response :success
  end

  test "should update guide" do
    patch :update, id: @guide, guide: { conductor_certificado_inscripcion: @guide.conductor_certificado_inscripcion, conductor_licencia_conducir: @guide.conductor_licencia_conducir, destinatario_apellido_nombre_razon_social: @guide.destinatario_apellido_nombre_razon_social, destinatario_dni: @guide.destinatario_dni, destinatario_ruc: @guide.destinatario_ruc, empresa_subcontratada_nombre_apellido_razon_social: @guide.empresa_subcontratada_nombre_apellido_razon_social, empresa_subcontratada_ruc: @guide.empresa_subcontratada_ruc, fecha_emision: @guide.fecha_emision, fecha_inicio_traslado: @guide.fecha_inicio_traslado, llegada_department_id: @guide.llegada_department_id, llegada_direccion: @guide.llegada_direccion, llegada_district_id: @guide.llegada_district_id, llegada_province_id: @guide.llegada_province_id, numero_remision_guia: @guide.numero_remision_guia, obsevaciones: @guide.obsevaciones, partida_department_id: @guide.partida_department_id, partida_direccion: @guide.partida_direccion, partida_district_id: @guide.partida_district_id, partida_province_id: @guide.partida_province_id, remitente_apellido_nombre_razon_social: @guide.remitente_apellido_nombre_razon_social, remitente_dni: @guide.remitente_dni, remitente_ruc: @guide.remitente_ruc, unidad_configuracion_vehicular: @guide.unidad_configuracion_vehicular, unidad_marca_vehiculo: @guide.unidad_marca_vehiculo, unidad_placa_delantera: @guide.unidad_placa_delantera, unidad_placa_trasera: @guide.unidad_placa_trasera }
    assert_redirected_to guide_path(assigns(:guide))
  end

  test "should destroy guide" do
    assert_difference('Guide.count', -1) do
      delete :destroy, id: @guide
    end

    assert_redirected_to guides_path
  end
end
