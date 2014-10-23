class SugestaoItemPautaController < ApplicationController
  load_and_authorize_resource
  before_action :set_sugestao_item_pautum, only: [:show, :edit, :update, :destroy]

  # GET /sugestao_item_pauta
  # GET /sugestao_item_pauta.json
  def index
    @sugestao_item_pauta = SugestaoItemPautum.all
  end

  # GET /sugestao_item_pauta/1
  # GET /sugestao_item_pauta/1.json
  def show
  end

  # GET /sugestao_item_pauta/new
  def new
    @sugestao_item_pautum = SugestaoItemPautum.new
    if params[:reuniao]
        @sugestao_item_pautum.reuniao = Reuniao.find(params[:reuniao])
     end
  end

  # GET /sugestao_item_pauta/1/edit
  def edit
  end

  # POST /sugestao_item_pauta
  # POST /sugestao_item_pauta.json
  def create


    @user = current_user
    @pessoa=Pessoa.search(@user.id)
    @sugestao_item_pautum = SugestaoItemPautum.new(sugestao_item_pautum_params)
    @sugestao_item_pautum.pessoa=@pessoa[0]
    @reuniao = Reuniao.find(@sugestao_item_pautum.reuniao) 
    if Convocado.search(@pessoa[0].id, @reuniao.id) != []  #com esse if eu evito que se convoque a mesma pessoa 2 vezes
    respond_to do |format|
      if @sugestao_item_pautum.save
        format.html { redirect_to reuniao_path(@sugestao_item_pautum.reuniao), notice: 'Sugestao cadastrada.' }
        format.json { render :show, status: :created, location: @sugestao_item_pautum }
      else
        format.html { render :new }
        format.json { render json: @sugestao_item_pautum.errors, status: :unprocessable_entity }
      end
    end
   else

             redirect_to  @reuniao , notice: 'Voce não pode sugerir nesta reunião.'
end
  end

  # PATCH/PUT /sugestao_item_pauta/1
  # PATCH/PUT /sugestao_item_pauta/1.json
  def update
    respond_to do |format|
    aux= SugestaoItemPautum.new(sugestao_item_pautum_params)

    if aux.aprovar =="não"
            puts"entro no if"
                  
              
                if @sugestao_item_pautum.update(sugestao_item_pautum_params)
                       format.html { redirect_to reuniao_path(@sugestao_item_pautum.reuniao), notice: 'Sugestao item pautum was successfully updated.' }
                       format.json { render :show, status: :ok, location: @sugestao_item_pautum }
                 else
                       format.html { render :edit }
                       format.json { render json: @sugestao_item_pautum.errors, status: :unprocessable_entity }
                 end
    else 


      if @sugestao_item_pautum.update(sugestao_item_pautum_params)
             @sugestao_item_pautum.motivoReprovar=nil
             @sugestao_item_pautum.save
             @reuniao = Reuniao.find(@sugestao_item_pautum.reuniao)
             @pautum = Pautum.find(@reuniao.pautum)
             @questao = Questao.find(@sugestao_item_pautum.questao)
             @item_pautum = ItemPautum.create
             @item_pautum.pautum=@pautum
             @item_pautum.questao=@questao
             if ItemPautum.search(@questao.id, @pautum.id) == []  #com esse if eu evito que se convoque a mesma pessoa 2 vezes
               @item_pautum.save
             end
          

          
        format.html { redirect_to reuniao_path(@sugestao_item_pautum.reuniao), notice: 'Sugestao item pautum was successfully updated.' }
        format.json { render :show, status: :ok, location: @sugestao_item_pautum }
      else
        format.html { render :edit }
        format.json { render json: @sugestao_item_pautum.errors, status: :unprocessable_entity }
      end
    end
   end
  end

  # DELETE /sugestao_item_pauta/1
  # DELETE /sugestao_item_pauta/1.json
  def destroy
    @aux=@sugestao_item_pautum
    @sugestao_item_pautum.destroy
    respond_to do |format|
      format.html { redirect_to reuniao_path(@aux.reuniao), notice: 'Sugestão de questão removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sugestao_item_pautum
      @sugestao_item_pautum = SugestaoItemPautum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sugestao_item_pautum_params
      params.require(:sugestao_item_pautum).permit(:aprovar, :motivoSugestao, :motivoReprovar, :pessoa_id, :reuniao_id, :questao_id)
    end
end
