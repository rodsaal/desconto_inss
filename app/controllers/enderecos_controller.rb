class EnderecosController < ApplicationController
  before_action :set_proponente
  before_action :set_endereco, only: %i[show edit update destroy]

  def index
    @enderecos = @proponente.enderecos
  end

  def show; end

  def new
    @endereco = @proponente.enderecos.build
  end

  def edit; end

  def create
    @endereco = @proponente.enderecos.build(endereco_params)
    if @endereco.save
      redirect_to [@proponente, @endereco], notice: 'Endereço foi criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @endereco.update(endereco_params)
      redirect_to [@proponente, @endereco], notice: 'Endereço foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @endereco.destroy
    redirect_to proponente_enderecos_url(@proponente), notice: 'Endereço foi excluído com sucesso.'
  end

  private

  def set_proponente
    @proponente = Proponente.find(params[:proponente_id])
  end

  def set_endereco
    @endereco = @proponente.enderecos.find(params[:id])
  end

  def endereco_params
    params.require(:endereco).permit(:logradouro, :numero, :bairro, :cidade, :estado, :cep)
  end
end
