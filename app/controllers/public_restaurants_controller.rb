class PublicRestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
