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

ActiveRecord::Schema.define(version: 20141007234947) do

  create_table "ata", force: true do |t|
    t.string   "status"
    t.string   "pdfAta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "documento_file_name"
    t.string   "documento_content_type"
    t.integer  "documento_file_size"
    t.datetime "documento_updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convocados", force: true do |t|
    t.string   "motivoAusencia"
    t.string   "presenca"
    t.string   "status"
    t.integer  "pessoa_id"
    t.integer  "reuniao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "convocados", ["pessoa_id"], name: "index_convocados_on_pessoa_id"
  add_index "convocados", ["reuniao_id"], name: "index_convocados_on_reuniao_id"

  create_table "item_pauta", force: true do |t|
    t.text     "observacao"
    t.integer  "pautum_id"
    t.integer  "questao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_pauta", ["pautum_id"], name: "index_item_pauta_on_pautum_id"
  add_index "item_pauta", ["questao_id"], name: "index_item_pauta_on_questao_id"

  create_table "locals", force: true do |t|
    t.string   "uf"
    t.string   "cidade"
    t.string   "endereco"
    t.text     "complemento"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participacaos", force: true do |t|
    t.string   "contribuicao"
    t.integer  "pessoa_id"
    t.integer  "reuniao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participacaos", ["pessoa_id"], name: "index_participacaos_on_pessoa_id"
  add_index "participacaos", ["reuniao_id"], name: "index_participacaos_on_reuniao_id"

  create_table "pauta", force: true do |t|
    t.string   "titulo"
    t.date     "data"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas", force: true do |t|
    t.string   "nome"
    t.integer  "cpf"
    t.string   "uf"
    t.string   "cidade"
    t.string   "endereco"
    t.string   "email"
    t.integer  "matricula"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "role"
    t.integer  "opcao"
  end

  add_index "pessoas", ["user_id"], name: "index_pessoas_on_user_id"

  create_table "pontos", force: true do |t|
    t.string   "titulo"
    t.date     "data"
    t.string   "staus"
    t.text     "solucao"
    t.integer  "questao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pontos", ["questao_id"], name: "index_pontos_on_questao_id"

  create_table "questaos", force: true do |t|
    t.string   "titulo"
    t.date     "data"
    t.string   "status"
    t.text     "solucao"
    t.integer  "pessoa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "questaos", ["pessoa_id"], name: "index_questaos_on_pessoa_id"
  add_index "questaos", ["user_id"], name: "index_questaos_on_user_id"

  create_table "reuniaos", force: true do |t|
    t.string   "titulo"
    t.date     "data"
    t.time     "horaInicio"
    t.time     "horaFim"
    t.string   "status"
    t.integer  "local_id"
    t.integer  "pautum_id"
    t.integer  "atum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "reuniaos", ["atum_id"], name: "index_reuniaos_on_atum_id"
  add_index "reuniaos", ["category_id"], name: "index_reuniaos_on_category_id"
  add_index "reuniaos", ["local_id"], name: "index_reuniaos_on_local_id"
  add_index "reuniaos", ["pautum_id"], name: "index_reuniaos_on_pautum_id"

  create_table "sugestao_item_pauta", force: true do |t|
    t.string   "aprovar"
    t.string   "motivoSugestao"
    t.string   "motivoReprovar"
    t.integer  "pessoa_id"
    t.integer  "reuniao_id"
    t.integer  "questao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sugestao_item_pauta", ["pessoa_id"], name: "index_sugestao_item_pauta_on_pessoa_id"
  add_index "sugestao_item_pauta", ["questao_id"], name: "index_sugestao_item_pauta_on_questao_id"
  add_index "sugestao_item_pauta", ["reuniao_id"], name: "index_sugestao_item_pauta_on_reuniao_id"

  create_table "users", force: true do |t|
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
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pessoa_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["pessoa_id"], name: "index_users_on_pessoa_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
