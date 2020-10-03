class TaxisController < ApplicationController
  before_action :set_taxi, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @taxis = Taxi.includes(:user).order("created_at DESC")
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
    params.require(:taxi).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def set_taxi
    @taxi = Taxi.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

