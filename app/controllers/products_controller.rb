class ProductsController < ApplicationController
  before_action :set_product, only: %i[show destroy edit update add_to_cart remove_from_cart]
  skip_before_action :authenticate_user!, only: %i[index show]

  ############### Métodos de READ ##################

  # Listagem de produtos: Se usuário estiver logado, não mostra seus próprios produtos pra comprar
  # Caso contrário, ele exibe todos os produtos do modelo Product
  def index
    if current_user
      @products = Product.all.where.not(user: current_user)
    else
      @products = Product.all
    end
  end

  # Exibição de um produto específico
  def show
    @product = Product.find(params[:id])
  end

  ############### Métodos de CREATE ################

  # Requisição GET: novo formulário de produto
  def new
    @product = Product.new
  end

  # Requisição POST: inserir as informações do formulário na base
  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to product_path(@product), notice: 'Produto salvo com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_products
    @products = Product.where(user: current_user)
  end

  ############### Método de DELETE ################

  # Deletar o produto da base e redirecionar para [escolher path destino. Provisório: products#index]
  def destroy
    @product.destroy
    redirect_to my_products_products_path, status: :see_other
  end

  ############### Método de EDIT ################

  def edit
  end

  ############### Método de UPDATE ################

  def update
    @product.update(product_params)
    redirect_to my_products_products_path, notice: 'Produto editado com sucesso'
  end

  ############## Métodos do carrinho ###############
  def add_to_cart
    session[:cart] << @product.id
    redirect_back_or_to product_path(@product.id)
  end

  def remove_from_cart
    session[:cart].delete(@product.id)
    redirect_back_or_to request.referer
  end

  def empty_cart
    session[:cart] = []
    redirect_back_or_to request.referer
  end

  private

  # Strong params, chamado no before_action
  def product_params
    params.require(:product).permit(:name, :price, :category, :description)
  end

  # Encontra o Produto com base no :id que vem em params via formulário
  def set_product
    @product = Product.find(params[:id])
  end
end
