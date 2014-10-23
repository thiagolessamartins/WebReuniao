class PessoasController < ApplicationController
  load_and_authorize_resource
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]

  # GET /pessoas
  # GET /pessoas.json
  def index
if params[:q] !=nil
    @pessoas = Pessoa.buscaCPF(params[:q])
else
    @pessoas = Pessoa.buscaMatricula(params[:p])

end
    respond_to do |format|
      format.html  #index.html.erb
      format.xml  { render :xml => @pessoa }
    end
  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
end

  # GET /pessoas/1/edit
  def edit
  end

  # POST /pessoas
  # POST /pessoas.json

  def create
    @user= current_user
    @pessoa = Pessoa.new(pessoa_params)
    respond_to do |format|
    if Pessoa.search(@user.id)== []

    @pessoa.user=@user
    @pessoa.email=@user.email

      if @pessoa.save
        @user.pessoa=@pessoa
        @user.save
        format.html { redirect_to @pessoa, notice: 'Pessoa was successfully created.' }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
  
    elsif @pessoa.opcao == 1

      if @pessoa.save
          @user = User.new(:email => @pessoa.email,
                 :password => '1234',
                 :password_confirmation => '1234',:role => @pessoa.role,:pessoa_id => @pessoa.id)

          sign_in @user


          sign_in current_user, :bypass => true 
          @pessoa.user=@user
          @pessoa.save
          format.html { redirect_to @pessoa, notice: 'Pessoa was successfully created.' }
          format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      
     end

    elsif @pessoa.opcao == 0


      if @pessoa.save
        format.html { redirect_to @pessoa, notice: 'Pessoa was successfully created.' }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
     
    else
        format.html { redirect_to root_path, notice: 'Desculpe mas,você não disse se queria criar um usuario.' }

    end
   end
  end

  # PATCH/PUT /pessoas/1
  # PATCH/PUT /pessoas/1.json
  def update
    @aux = Pessoa.new(pessoa_params)
    respond_to do |format|
    if @aux.opcao == 1
     if @pessoa.user == nil

      if @pessoa.update(pessoa_params)
          @user = User.new(:email => @pessoa.email,
                 :password => '1234',
                 :password_confirmation => '1234',:role => @pessoa.role,:pessoa_id => @pessoa.id)
          sign_in @user
          sign_in current_user, :bypass => true 
          @pessoa.user=@user
          @pessoa.save
        format.html { redirect_to @pessoa, notice: 'Pessoa was successfully updated.' }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    else
        format.html { redirect_to edit_pessoa_path(@pessoa), notice: 'Desculpe mas,você já possui um usuario, marque a opção não desta vez.' }
    end
    elsif @aux.opcao == 0

      if @pessoa.update(pessoa_params)
        if @pessoa.user != nil

           @user=@pessoa.user
           @user.role=@pessoa.role
           @user.save
        end
        format.html { redirect_to @pessoa, notice: 'Pessoa was successfully updated.' }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    @pessoa.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: 'Pessoa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :cpf, :uf, :cidade, :endereco, :email, :matricula,:user_id,:role,:opcao)
    end
end
