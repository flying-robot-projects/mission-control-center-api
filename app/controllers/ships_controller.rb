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
  end

  def update
  end

  def destroy
  end

  private

    def ship_params
      params.require(:ship).permit(:name, :ship_model_id, :status)
    end

end