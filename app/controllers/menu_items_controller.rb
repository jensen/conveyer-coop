class MenuItemsController < ApplicationController
  def show
    @item = MenuItem.find(params[:id])
  end
end
