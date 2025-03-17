class Admin::RestaurantsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_restaurant, only: [ :show, :edit, :update, :destroy, :delete_picture ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    logger.debug "Restaurant Params: #{restaurant_params.inspect}"

    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_restaurant_path(@restaurant), notice: "Restaurant was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant), notice: "Restaurant was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path, notice: "Restaurant was successfully destroyed."
  end

  def delete_picture
    picture = @restaurant.pictures.find(params[:picture_id]) # Find the picture by ID
    picture.purge if picture
    redirect_to admin_restaurant_path(@restaurant), notice: "Picture was successfully deleted."
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :cuisine, :description, pictures: [])
  end

  def authorize_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
