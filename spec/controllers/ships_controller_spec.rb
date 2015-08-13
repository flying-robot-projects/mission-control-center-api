require "rails_helper"

RSpec.describe "ShipsController", :type => :request do

  before { @ship = create(:ship) }
  after { Ship.destroy_all }

  describe "Index action" do
    let!(:ship) { create(:ship) }
    before { get ships_path }
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to include @ship.to_json }
    it { expect(JSON.parse(response.body).count).to eq 2 }
    it { expect(JSON.parse response.body).to be_an_instance_of Array }
  end

  describe "Create action" do

    context "with valid attributes" do
      let(:valid_params) { attributes_for(:ship) }
      before { post ships_path(ship: valid_params) }
      it { expect(response.status).to eq 201 }
    end

    context "with invalid attributes" do
      let(:invalid_params) {{ invalid_key: "never assigned value" }}
      before { post ships_path(ship: invalid_params) }
      it { expect(response.status).to eq 422 }
    end
  end

  describe "Show action" do
    before { get ship_path(@ship.id) }
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to include @ship.to_json }
  end

  describe "Update action" do

    context "with allowed params" do
      before { patch ship_path(id: @ship.id, ship: { name: "Atlantis" }) }
      it { expect(response.status).to eq 200 }
      it { expect(JSON.parse(response.body)["ship"]["name"]).to eq "Atlantis" }
    end

    context "with unallowed params" do
      before { patch ship_path(id: @ship.id, ship: { bad_key: "never assigned value" }) }
      it { expect(response.status).to eq 200 }
      it { expect(response.body).to include @ship.to_json }
    end
  end

  describe "Destroy action" do
    let!(:ship) { create(:ship) }

    context "when ship ID doesn't exist" do
      before { delete ship_path(-1) }
      it { expect(response.status).to eq 404 }
    end

    context "when ship ID exists" do
      before { delete ship_path(ship.id) }
      it { expect(response.status).to eq 200 }
      it { expect(response.body).to include ship.to_json }
    end

    context "when ship is associated with a mission" do
      let!(:mission) { create(:mission, ship: ship) }
      before do
        delete ship_path(ship.id)
        get mission_path(mission.id)
      end
      it { expect(response.status).to eq 404 }
    end
  end

end