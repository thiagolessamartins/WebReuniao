class ItemPautaController < ApplicationController
  load_and_authorize_resource
  before_action :set_item_pautum, only: [:show, :edit, :update, :destroy]

  # GET /item_pauta
  # GET /item_pauta.json
  def index
    @item_pauta = ItemPautum.all
  end

  # GET /item_pauta/1
  # GET /item_pauta/1.json
  def show
  end

  # GET /item_pauta/new
  def new
    @item_pautum = ItemPautum.new
    if params[:pautum]
        @item_pautum.pautum = Pautum.find(params[:pautum])
     end
  end

  # GET /item_pauta/1/edit
  def edit
  end

  # POST /item_pauta
  # POST /item_pauta.json
  def create
    respond_to do |format|
      aux= params[:item_pautum][:questao_id]
     if aux.size > 1
      for x in aux
            if x == ""
                 break#a ultima posição do array e um "" e isso não é um id por tanto da erro entao esse if resolve isso
            end

           @questao=Questao.find(x) #aqui eupego a pessoa com o id q ta no x
           @item_pautum = ItemPautum.new(item_pautum_params)
           @pautum = Pautum.find(@item_pautum.pautum) 
           if ItemPautum.search(@questao.id, @pautum.id) == []  #com esse if eu evito que se convoque a mesma pessoa 2 vezes
             @item_pautum.questao=@questao# passo o objeto questao para item pauta
             @item_pautum.pautum=@pautum# passo o objeto pauta para item pauta
             if Ponto.buscarPonto(@item_pautum.questao.id).size >=1
             @item_pautum.save
             end
           end
      end

        format.html { redirect_to @pautum, notice: 'Questões alocadas com sucesso.' }
        format.json { render :show, status: :created, location: @pautum }
    else


            format.html { redirect_to pautum_path(@item_pautum.pautum), notice: 'Desculpe mas,você não selecionou as questões.' }
         end
    end
  end

  # PATCH/PUT /item_pauta/1
  # PATCH/PUT /item_pauta/1.json
  def update
    respond_to do |format|
      if @item_pautum.update(item_pautum_params)
        format.html { redirect_to @item_pautum, notice: 'Item pautum was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_pautum }
      else
        format.html { render :edit }
        format.json { render json: @item_pautum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_pauta/1
  # DELETE /item_pauta/1.json
  def destroy
    @aux=@item_pautum
    @item_pautum.destroy
    respond_to do |format|
      format.html { redirect_to pautum_path(@aux.pautum), notice: 'Item  da pauta removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_pautum
      @item_pautum = ItemPautum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_pautum_params
      params.require(:item_pautum).permit(:observacao, :pautum_id, :questao_id)
    end
end
