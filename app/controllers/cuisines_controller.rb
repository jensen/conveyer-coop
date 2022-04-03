class CuisinesController < ApplicationController
  before_action :set_cuisines

  def index
    @restaurants = Restaurant.all.order("name")
  end

  def show
    @cuisine = Cuisine.find_by_slug(params[:slug])
  end

  private

    def set_cuisines
      @cuisines = Cuisine.all
    end
end
