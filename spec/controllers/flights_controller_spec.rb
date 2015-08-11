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

  describe "Create action" do

    context "with valid params" do
      let(:valid_params) { attributes_for(:flight) }
      before { post flights_path(valid_params) }
      it { expect(response.status).to eq 201 }
    end

    context "with invalid params" do

      context "when missing or unknown params" do
      end

      context "but unknown ship ID" do
        before { post flights_path(valid_params, ship_id: -1) }
        it { expect(response.status).to eq 404 }
      end
    end
  end

  describe "Show action" do

    context "when flight ID doesn't exist" do
      before { get flight_path(-1) }
      it { expect(response.status).to eq 404 }
    end

    context "when flight ID exists" do
      before { get flight_path(@flight.id) }
      it { expect(response.body).to include @flight.to_json }
      it { expect(response.body).to include @flight.ship.to_json }
      it { expect(JSON.parse response.body).not_to be_an_instance_of Array }
    end
  end

  describe "Update action" do

    context "with allowed params" do
      before { patch flight_path(id: @flight.id, flight: { status: "in flight" }) }
      it { expect(response.status).to eq 200 }
      it { expect(JSON.parse(response.body)["flight"]["status"]).to eq "in flight" }
    end

    context "with unallowed params" do
      before { patch flight_path(id: @flight.id, flight: { bad_key: "never assigned value" }) }
      it { expect(response.status).to eq 200 }
      it { expect(response.body).to include @flight.to_json }
    end
  end

end