class UserController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /ata
  # GET /ata.json
  def index
super
  end

  # GET /ata/1
  # GET /ata/1.json
  def show
  end

  # GET /ata/new
  def new
    @user = User.new
  end

  # GET /ata/1/edit
  def edit
  end

  # POST /ata
  # POST /ata.json
  def create
    @user = User.new(user_params)
    @user.pessoa=Pessoa.new

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Atum was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ata/1
  # PATCH/PUT /ata/1.json
  def update
super
  end

  # DELETE /ata/1
  # DELETE /ata/1.json
  def destroy
super
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :email, :password, :password_confirmation, :remember_me,:pessoa_id)
    end
end
