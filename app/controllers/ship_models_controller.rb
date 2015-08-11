class ShipModelsController < ApplicationController

  def index
    @ship_models = ShipModel.all
  end

  def create
  end

  def update
  end

  def destroy
  end

end