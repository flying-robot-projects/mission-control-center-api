require "rails_helper"

RSpec.describe "FlightsController", :type => :request do

  before { @flight = create(:flight) }
  after { Flight.destroy_all }

  describe "Index action" do
    before { get flights_path }
    it { expect(response.body).to include @flight.to_json }
    it { expect(JSON.parse response.body).to be_an_instance_of Array }
  end

  describe "Show action" do
    before { get flight_path(@flight.id) }
    it { expect(response.body).to include @flight.to_json }
    it { expect(JSON.parse response.body).not_to be_an_instance_of Array }
  end

end