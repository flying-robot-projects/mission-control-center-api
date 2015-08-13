class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def create
    @ship = Ship.create(ship_params)
    render nothing: true, status: :unprocessable_entity and return unless @ship.id
    render "ships/show", status: :created
  end

  def show
    @ship = Ship.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def update
    @ship = Ship.find params[:id]
    @ship.update! ship_params
    render "ships/show", status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def destroy
    @ship = Ship.find params[:id]
    @ship.destroy!
    Mission.where(ship_id: @ship.id).each { |mission| mission.destroy! }
    render "ships/show", status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  private

    def ship_params
      params.require(:ship).permit(:name, :status, :category)
    end

end