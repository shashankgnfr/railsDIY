class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]


  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end
  end

  def show  
    @locations = Location.near([@location.latitude, @location.longitude], 50, :order => :distance)
  end

  def new
    @location = Location.new
  end

  def edit; end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.' 
    else
     render :new 
    end
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: 'Location was successfully updated.' 
    else
     render :edit 
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: 'Location was successfully destroyed.' 
  end

  private
   
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end

end
