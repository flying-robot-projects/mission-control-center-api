class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def create
  end

  def show
    @flight = Flight.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown flight with ID #{params[:id].to_s} (not found)", status: 404
  end

  def update
  end

  private

    def flight_params
      params.require(:flight).permit(:ship_id, :status, :telemetric_recordings)
    end

end