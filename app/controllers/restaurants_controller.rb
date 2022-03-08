class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find_by_slug(params[:slug])
  end
end
