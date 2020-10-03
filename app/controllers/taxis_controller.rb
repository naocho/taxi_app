class TaxisController < ApplicationController
  before_action :set_taxi, only: [:edit, :show]

  def index
    @taxis = Taxi.all
  end

  def new
    @taxi = Taxi.new
  end

  def create
    Taxi.create(taxi_params)

  end

  def destroy
    taxi = Taxi.find(params[:id])
    taxi.destroy
  end

  def edit
    
  end

  def update
    taxi = Taxi.find(params[:id])
    taxi.update(taxi_params)
  end

  def show
    
  end

  private

  def taxi_params
    params.require(:taxi).permit(:name, :image, :text)
  end

  def set_taxi
    @taxi = Taxi.find(params[:id])
  end

end

