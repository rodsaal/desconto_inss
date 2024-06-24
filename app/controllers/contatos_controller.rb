class ContatosController < ApplicationController
  before_action :set_proponente
  before_action :set_contato, only: %i[show edit update destroy]

  def index
    @contatos = @proponente.contatos
  end

  def show; end

  def new
    @contato = @proponente.contatos.build
  end

  def edit; end

  def create
    @contato = @proponente.contatos.build(contato_params)
    if @contato.save
      redirect_to [@proponente, @contato], notice: 'Contato foi criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @contato.update(contato_params)
      redirect_to [@proponente, @contato], notice: 'Contato foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @contato.destroy
    redirect_to proponente_contatos_url(@proponente), notice: 'Contato foi excluído com sucesso.'
  end

  private

  def set_proponente
    @proponente = Proponente.find(params[:proponente_id])
  end

  def set_contato
    @contato = @proponente.contatos.find(params[:id])
  end

  def contato_params
    params.require(:contato).permit(:telefone, :email)
  end
end
