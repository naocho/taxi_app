class TaxisController < ApplicationController
  before_action :set_taxi, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @taxis = Taxi.includes(:user).order("created_at DESC")
  end

  def new
    @taxi = Taxi.new
  end

  def create
    @taxi = Taxi.new(taxi_params)

    if @taxi.valid?
      @taxi.save
      redirect_to "/taxis"
    else
      render :new
    end 
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
    @comment = Comment.new
    @comments = @taxi.comments.includes(:user)
  end

  def search
    @taxis = Taxi.search(params[:title]).order("created_at DESC")
  end

  private

  def taxi_params
    params.require(:taxi).permit(:departure, :arrival, :image, :title, :text).merge(user_id: current_user.id)
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

