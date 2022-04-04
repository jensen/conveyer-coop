class OrdersController < ApplicationController
  def new
    @cart = current_cart

    delivery = order_params[:delivery] === "true"
    address = delivery ? @cart.delivery_address : @cart.pickup_address

    @order = Order.new(delivery: delivery, address: address)
  end

  def create
    @cart = current_cart
    @order = Order.new(order_params)

    @cart.line_items.each do |item|
      @order.line_items << item
    end

    if @order.save
      reset_cart
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

    def order_params
      params.fetch(:order, { delivery: "true" })
            .permit(:delivery, :address)
    end
end
