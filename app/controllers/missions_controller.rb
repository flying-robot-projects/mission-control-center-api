class MissionsController < ApplicationController

  def index
    @missions = Mission.all
  end

  def create
    raise ActiveRecord::RecordNotFound unless Ship.exists? params[:mission][:ship_id]
    params["mission"]["telemetric_recordings"] = nil unless params["mission"]["telemetric_recordings"].length != 0
    @mission = Mission.create(mission_params)
    render "missions/show", status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown ship with ID #{params[:mission][:ship_id].to_s} (not found)", status: :unprocessable_entity
  end

  def show
    @mission = Mission.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown mission with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  def update
    @mission = Mission.find params[:id]
    @mission.update!(mission_params)
    render "missions/show", status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: "Unknown mission with ID #{params[:id].to_s} (not found)", status: :not_found
  end

  private

    def mission_params
      params.require(:mission).permit(:ship_id, :status, :telemetric_recordings)
    end

end