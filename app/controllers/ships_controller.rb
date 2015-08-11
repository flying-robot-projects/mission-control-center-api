class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def create
  raise ActiveRecord::RecordNotFound unless ShipModel.exists? params[:ship][:ship_model_id]
    @ship = Ship.create(ship_params)
    render "ships/show", status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship_model with ID #{params[:ship][:ship_model_id].to_s} (not found)", status: :not_found
  end

  def show
    @ship = Ship.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def update
    @ship = Ship.find params[:id]
    @ship.update!(ship_params)
    render "ships/show", status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def destroy
    @ship = Ship.find params[:id]
    @ship.destroy!
    Flight.where(ship_id: @ship.id).each { |flight| flight.destroy! }
    render "ships/destroy", status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  private

    def ship_params
      params.require(:ship).permit(:name, :ship_model_id, :status)
    end

end