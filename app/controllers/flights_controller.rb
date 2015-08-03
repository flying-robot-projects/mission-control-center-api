class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def show
  end
end
