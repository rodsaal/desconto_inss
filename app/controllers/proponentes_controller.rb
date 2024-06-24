class ProponentesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_proponente, only: %i[show edit update destroy]

  # GET /proponentes or /proponentes.json
  def index
    @proponentes = Proponente.page(params[:page]).per(5)
  end

  # GET /proponentes/1 or /proponentes/1.json
  def show; end

  # GET /proponentes/new
  def new
    @proponente = Proponente.new
    @proponente.build_endereco
    @proponente.build_contato
  end

  # GET /proponentes/1/edit
  def edit; end

  # POST /proponentes or /proponentes.json
  def create
    @proponente = Proponente.new(proponente_params)

    respond_to do |format|
      if @proponente.save
        format.html { redirect_to proponente_url(@proponente), notice: 'Proponente foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @proponente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proponente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proponentes/1 or /proponentes/1.json
  def update
    respond_to do |format|
      if @proponente.update(proponente_params)
        format.html { redirect_to proponente_url(@proponente), notice: 'Proponente alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @proponente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proponentes/1 or /proponentes/1.json
  def destroy
    @proponente.destroy!

    respond_to do |format|
      format.html { redirect_to proponentes_url, notice: 'Proponente deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def relatorio_funcionarios
    @funcionarios_faixa_1 = Proponente.where(salario: ..1045.00).count
    @funcionarios_faixa_2 = Proponente.where('salario > ? AND salario <= ?', 1045.00, 2089.60).count
    @funcionarios_faixa_3 = Proponente.where('salario > ? AND salario <= ?', 2089.60, 3134.40).count
    @funcionarios_faixa_4 = Proponente.where('salario > ? AND salario <= ?', 3134.40, 6101.06).count
    @funcionarios_faixa_5 = Proponente.where('salario > ?', 6101.06).count

    @data_for_chart = {
      'Até R$ 1.045,00': @funcionarios_faixa_1,
      'De R$ 1.045,01 a R$ 2.089,60': @funcionarios_faixa_2,
      'De R$ 2.089,60 a R$ 3134.40': @funcionarios_faixa_3,
      'De R$ 3134.40 a R$ 6101.06': @funcionarios_faixa_4,
      'Acima de 6101.06': @funcionarios_faixa_5
    }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proponente
    @proponente = Proponente.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def proponente_params
    params.require(:proponente).permit(:nome, :cpf, :data_nascimento, :salario, :desconto_inss,
                                       endereco_attributes: %i[id logradouro numero bairro cidade estado cep _destroy],
                                       contato_attributes: %i[id telefone email _destroy])
  end
end
