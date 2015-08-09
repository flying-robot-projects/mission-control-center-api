require "rails_helper"

RSpec.describe "FlightsController", :type => :request do

  before { @flight = create(:flight) }
  after { Flight.destroy_all }

  describe "Index action" do
    let!(:flight) { create(:flight) }
    before { get flights_path }
    it { expect(response.body).to include @flight.to_json }
    it { expect(JSON.parse(response.body).count).to eq 2 }
    it { expect(JSON.parse response.body).to be_an_instance_of Array }
  end

  pending "Create action"

  describe "Show action" do

    context "when flight ID doesn't exist" do
      before { get flight_path(999) }
      it { expect(response.status).to eq 404 }
      it { expect(response.body).to match /not found/ }
    end

    context "when flight ID exists" do
      before { get flight_path(@flight.id) }
      it { expect(response.body).to include @flight.to_json }
      it { expect(response.body).to include @flight.ship.to_json }
      it { expect(JSON.parse response.body).not_to be_an_instance_of Array }
    end

  end

  pending "Update action"

end