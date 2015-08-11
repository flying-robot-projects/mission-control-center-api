class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def create
    raise ActiveRecord::RecordNotFound unless Ship.exists? params[:flight][:ship_id]
    @flight = Flight.create(flight_params)
    render "flights/show", status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:flight][:ship_id].to_s} (not found)", status: :not_found
  end

  def show
    @flight = Flight.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown flight with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def update
    @flight = Flight.find params[:id]
    @flight.update!(flight_params)
    render "flights/show", status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown flight with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  private

    def flight_params
      params.require(:flight).permit(:ship_id, :status, :telemetric_recordings)
    end

end