class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def show
    if params[:id]
      @flight = Flight.find params[:id]
    else
      render :json, "ID params is required"
    end
  end

  private

    def flight_params
      params.require(:flight).permit(:ship_id, :status, :telemetric_recordings)
    end

end