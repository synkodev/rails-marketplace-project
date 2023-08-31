class OrdersController < ApplicationController


  def index
    @orders = Order.all
    @user_orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])

  end


  def edit
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, notice: "Pedido excluído com sucesso."
  end

end
