class PontosController < ApplicationController
  load_and_authorize_resource
  before_action :set_ponto, only: [:show, :edit, :update, :destroy]

  # GET /pontos
  # GET /pontos.json
  def index
    @pontos = Ponto.all
  end

  # GET /pontos/1
  # GET /pontos/1.json
  def show
  end

  # GET /pontos/new
  def new
    @ponto = Ponto.new
    if params[:questao]
        @ponto.questao = Questao.find(params[:questao])
     end
  end

  # GET /pontos/1/edit
  def edit
  end

  # POST /pontos
  # POST /pontos.json
  def create
    @ponto = Ponto.new(ponto_params)
    @user = current_user
    if @user == @ponto.questao.user

    respond_to do |format|
      if @ponto.save
        format.html { redirect_to questao_path(@ponto.questao), notice: 'Ponto cadastrado.' }
        format.json { render :show, status: :created, location: @ponto }
      else
        format.html { render :new }
        format.json { render json: @ponto.errors, status: :unprocessable_entity }
      end
    end
else
            redirect_to questao_path(@ponto.questao) , notice: 'Desculpe mas,está questão não é sua.'
end
  end

  # PATCH/PUT /pontos/1
  # PATCH/PUT /pontos/1.json
  def update
    @user = current_user
    if @user == @ponto.questao.user
    respond_to do |format|
      if @ponto.update(ponto_params)
        format.html { redirect_to questao_path(@ponto.questao), notice: 'Ponto was successfully updated.' }
        format.json { render :show, status: :ok, location: @ponto }
      else
        format.html { render :edit }
        format.json { render json: @ponto.errors, status: :unprocessable_entity }
      end
    end
else
            redirect_to questao_path(@ponto.questao) , notice: 'Desculpe mas,está questão não é sua.'
end
  end

  # DELETE /pontos/1
  # DELETE /pontos/1.json
  def destroy
    @user = current_user
    if @user == @ponto.questao.user
    @ponto.destroy
    respond_to do |format|
      format.html { redirect_to questao_path(@ponto.questao), notice: 'Ponto removido.' }
      format.json { head :no_content }
    end
else
            redirect_to questao_path(@ponto.questao) , notice: 'Desculpe mas,está questão não é sua.'
end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ponto
      @ponto = Ponto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ponto_params
      params.require(:ponto).permit(:titulo, :data, :staus, :solucao, :questao_id)
    end
end
