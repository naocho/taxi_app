class TaxisController < ApplicationController
  def index
    @taxis = Taxi.all
  end
end
