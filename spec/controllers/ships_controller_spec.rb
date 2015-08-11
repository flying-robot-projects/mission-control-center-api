require "rails_helper"

RSpec.describe "ShipsController", :type => :request do

  before { @ship = create(:ship) }
  after { Ship.destroy_all }

  describe "Index action" do

    let!(:ship) { create(:ship) }
    before { get ships_path }
    it { expect(response.body).to include @ship.to_json }
    it { expect(JSON.parse(response.body).count).to eq 2 }
    it { expect(JSON.parse response.body).to be_an_instance_of Array }

  end

  describe "Create action" do

    context "with existing ship_model ID" do
      before { post ships_path(ship: { ship_model_id: @ship.ship_model.id }) }
      it { expect(response.status).to eq 201 }
    end

    context "with unknown ship ID" do
      before { post ships_path(ship: { ship_model_id: -1 }) }
      it { expect(response.status).to eq 404 }
      it { expect(response.body).to match /not found/ }
    end

  end

  describe "Show action" do

    context "when ship ID doesn't exist" do
      before { get ship_path(-1) }
      it { expect(response.status).to eq 404 }
      it { expect(response.body).to match /not found/ }
    end

    context "when ship ID exists" do
      before { get ship_path(@ship.id) }
      it { expect(response.body).to include @ship.to_json }
      it { expect(response.body).to include @ship.ship_model.to_json }
      it { expect(JSON.parse response.body).not_to be_an_instance_of Array }
    end

  end

  pending "Update action"

  pending "Destroy action"

end