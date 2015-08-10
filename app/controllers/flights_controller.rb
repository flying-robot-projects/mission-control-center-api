class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def create
    @ship = Ship.find params[:ship_id]
    @flight = Flight.create(ship: @ship, status: "pending")
    render @flight, status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def show
    @flight = Flight.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown flight with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def update
  end

  private

    def flight_params
      params.require(:flight).permit(:ship_id, :status, :telemetric_recordings)
    end

end