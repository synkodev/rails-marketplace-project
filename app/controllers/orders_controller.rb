class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(user: current_user, status: 'Aberto')
    if @order.save
      @cart.map { |product| Cart.new(order: @order, product:, quantity: 1).save! }
      session[:cart] = []
      redirect_to root_path
    else
      render 'pages/cart_details', status: :unprocessable_entity
    end
  end
end
