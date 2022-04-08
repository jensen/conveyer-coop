class LineItemsController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]

  def new
    @line_item = current_cart.line_items.build(new_line_item_params)
  end

  def create
    @line_item = current_cart.line_items.build(line_item_params.merge(new_line_item_params))

    if @line_item.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(slug: @line_item.restaurant.slug) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_path(slug: @line_item.restaurant.slug) }
      format.turbo_stream
    end
  end

  private
    def new_line_item_params
      params.permit(:menu_item_id)
    end

    def line_item_params
      params.require(:line_item).permit(:quantity)
    end
end
