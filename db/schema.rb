# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140718224559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "backs", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.string   "nombre"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fronts", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guides", force: true do |t|
    t.string   "numero_remision_guia"
    t.date     "fecha_emision"
    t.date     "fecha_inicio_traslado"
    t.string   "partida_direccion"
    t.string   "partida_district_id"
    t.string   "partida_province_id"
    t.string   "partida_department_id"
    t.string   "llegada_direccion"
    t.string   "llegada_district_id"
    t.string   "llegada_province_id"
    t.string   "llegada_department_id"
    t.string   "remitente_apellido_nombre_razon_social"
    t.string   "remitente_ruc"
    t.string   "remitente_dni"
    t.string   "destinatario_apellido_nombre_razon_social"
    t.string   "destinatario_ruc"
    t.string   "destinatario_dni"
    t.string   "unidad_marca_vehiculo"
    t.string   "unidad_placa_delantera"
    t.string   "unidad_placa_trasera"
    t.string   "unidad_configuracion_vehicular"
    t.string   "conductor_certificado_inscripcion"
    t.string   "conductor_licencia_conducir"
    t.string   "empresa_subcontratada_nombre_apellido_razon_social"
    t.string   "empresa_subcontratada_ruc"
    t.text     "obsevaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.string   "cantidad"
    t.string   "unidad"
    t.string   "peso"
    t.integer  "guide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "nombre"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
