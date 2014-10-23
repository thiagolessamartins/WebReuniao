class ConvocadosController < ApplicationController
  load_and_authorize_resource
  before_action :set_convocado, only: [:show, :edit, :update, :destroy]

  # GET /convocados
  # GET /convocados.json
  def index
    @convocados = Convocado.all
  end

  # GET /convocados/1
  # GET /convocados/1.json
  def show
  end

  # GET /convocados/new
  def new
    @convocado = Convocado.new
    if params[:reuniao]
        @convocado.reuniao = Reuniao.find(params[:reuniao])
     end
  end

  # GET /convocados/1/edit
  def edit
  end
  def correto
         @user = current_user
      @pessoa = Pessoa.find(@convocado.pessoa)
    if @user == @pessoa.user
      return true
     end

  end
  # POST /convocados
  # POST /convocados.json
  def create

    respond_to do |format|
      aux= params[:convocado][:pessoa_id]
           if aux.size > 1
 
      for x in aux
            if x == ""
                 break#a ultima posição do array e um "" e isso não é um id por tanto da erro entao esse if resolve isso
            end
            @pessoa=Pessoa.find(x) #aqui eupego a pessoa com o id q ta no x

            @convocado = Convocado.new(convocado_params)#colocando o new dentro for me permite fazer varias convocaçoes com id diferentes o que evida erro se o id foce o mesmo nao seria create e sim update de fk de pessoa   
            @reuniao = Reuniao.find(@convocado.reuniao) 

            if Convocado.search(@pessoa.id, @reuniao.id) == []  #com esse if eu evito que se convoque a mesma pessoa 2 vezes
               @convocado.pessoa=@pessoa# passo o objeto para convocado
               @convocado.save
            end

      end
      @reuniao = Reuniao.find(@convocado.reuniao) 


        format.html { redirect_to @reuniao, notice: 'Participacao was successfully created.' }
        format.json { render :show, status: :created, location: @reuniao }
    else


            format.html { redirect_to reuniao_path(@convocado.reuniao), notice: 'Desculpe mas,você não selecionou ninguem.' }
         end
    end
  end

  # PATCH/PUT /convocados/1
  # PATCH/PUT /convocados/1.json
  def update
         @user = current_user
      @pessoa = Pessoa.find(@convocado.pessoa)
    if @user == @pessoa.user
    respond_to do |format|
      if @convocado.update(convocado_params)
        format.html { redirect_to reuniao_path(@convocado.reuniao), notice: 'Convocado was successfully updated.' }
        format.json { render :show, status: :ok, location: @convocado }
      else
        format.html { render :edit }
        format.json { render json: @convocado.errors, status: :unprocessable_entity }
      end
    end
   else
               redirect_to reuniao_path(@convocado.reuniao) , notice: 'Desculpe mas,você não essa pessoa.'
end
  end

  # DELETE /convocados/1
  # DELETE /convocados/1.json
  def destroy
    @aux=@convocado
    @convocado.destroy
    respond_to do |format|
      format.html { redirect_to reuniao_path(@aux.reuniao), notice: 'Convocação foi removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convocado
      @convocado = Convocado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convocado_params
      params.require(:convocado).permit(:motivoAusencia, :presenca, :status, :pessoa_id, :reuniao_id)
    end
end
