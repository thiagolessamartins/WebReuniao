class ParticipacaosController < ApplicationController
  load_and_authorize_resource
  before_action :set_participacao, only: [:show, :edit, :update, :destroy]

  # GET /participacaos
  # GET /participacaos.json
  def index
    @participacaos = Participacao.all
  end

  # GET /participacaos/1
  # GET /participacaos/1.json
  def show
  end

  # GET /participacaos/new
  def new
    @participacao = Participacao.new
    if params[:reuniao]
        @participacao.reuniao = Reuniao.find(params[:reuniao])
     end
  end

  # GET /participacaos/1/edit
  def edit
  end

  # POST /participacaos
  # POST /participacaos.json
  def create

    respond_to do |format|
      aux= params[:participacao][:pessoa_id]
     if aux.size > 1


      for x in aux
            if x == ""
                 break#a ultima posição do array e um "" e isso não é um id por tanto da erro entao esse if resolve isso
            end
            @pessoa=Pessoa.find(x) #aqui eupego a pessoa com o id q ta no x

            @participacao = Participacao.new(participacao_params)#colocando o new dentro for me permite fazer varias participacao com id diferentes o que evida erro se o id foce o mesmo nao seria create e sim update de fk de pessoa   
            @reuniao = Reuniao.find(@participacao.reuniao) 

            if Participacao.search(@pessoa.id, @reuniao.id) == []  #com esse if eu evito que se convoque a mesma pessoa 2 vezes
               @participacao.pessoa=@pessoa# passo o objeto para convocado
               @participacao.save
            end

      end
      @reuniao = Reuniao.find(@participacao.reuniao) 


        format.html { redirect_to @reuniao, notice: 'Participacao was successfully created.' }
        format.json { render :show, status: :created, location: @reuniao }
        
    else


            format.html { redirect_to reuniao_path(@participacao.reuniao), notice: 'Desculpe mas,você não selecionou ninguem.' }
         end
    end
  end

  # PATCH/PUT /participacaos/1
  # PATCH/PUT /participacaos/1.json
  def update
    respond_to do |format|
      if @participacao.update(participacao_params)
        format.html { redirect_to @participacao, notice: 'Participacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @participacao }
      else
        format.html { render :edit }
        format.json { render json: @participacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participacaos/1
  # DELETE /participacaos/1.json
  def destroy
    @aux=@participacao
    @participacao.destroy
    respond_to do |format|
      format.html { redirect_to reuniao_path(@participacao.reuniao), notice: 'Participacão foi removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participacao
      @participacao = Participacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participacao_params
      params.require(:participacao).permit(:contribuicao, :pessoa_id, :reuniao_id)
    end
end
