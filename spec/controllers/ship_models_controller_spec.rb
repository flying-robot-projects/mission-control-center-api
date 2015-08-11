require "rails_helper"

RSpec.describe "ShipModelsController", :type => :request do

  before { @ship_model = create(:ship_model) }
  after { ShipModel.destroy_all }

  describe "Index action" do
    let!(:ship_model) { create(:ship_model) }
    before { get ship_models_path }
    it { expect(response.body).to include @ship_model.to_json }
    it { expect(JSON.parse(response.body).count).to eq 2 }
    it { expect(JSON.parse response.body).to be_an_instance_of Array }
  end

  describe "Create action" do

    context "with valid params" do
      before { post ship_models_path(ship_model: { ship_id: @ship_model.ship.id }) }
      it { expect(response.status).to eq 201 }
    end

    context "with invalid params" do
      before { post ship_models_path(ship_model: { ship_id: @ship_model.ship.id }) }
      it { expect(response.status).to eq 504 }
    end
  end

  pending "Update action"

  pending "Destroy action"

end