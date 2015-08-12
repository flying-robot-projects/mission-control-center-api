require "rails_helper"

RSpec.describe "MissionsController", :type => :request do

  before { @mission = create(:mission) }
  after { Mission.destroy_all }

  describe "Index action" do
    let!(:mission) { create(:mission) }
    before { get missions_path }
    it { expect(response.body).to include @mission.to_json }
    it { expect(JSON.parse(response.body).count).to eq 2 }
    it { expect(JSON.parse response.body).to be_an_instance_of Array }
  end

  describe "Create action" do

    context "with valid params" do
      let(:valid_params) { attributes_for(:mission) }
      before { post missions_path(valid_params) }
      it { expect(response.status).to eq 201 }
    end

    context "with invalid params" do

      context "when missing or unknown params" do
      end

      context "but unknown ship ID" do
        before { post missions_path(valid_params, ship_id: -1) }
        it { expect(response.status).to eq 404 }
      end
    end
  end

  describe "Show action" do

    context "when mission ID doesn't exist" do
      before { get mission_path(-1) }
      it { expect(response.status).to eq 404 }
    end

    context "when mission ID exists" do
      before { get mission_path(@mission.id) }
      it { expect(response.body).to include @mission.to_json }
      it { expect(response.body).to include @mission.ship.to_json }
      it { expect(JSON.parse response.body).not_to be_an_instance_of Array }
    end
  end

  describe "Update action" do

    context "with allowed params" do
      before { patch mission_path(id: @mission.id, mission: { status: "in mission" }) }
      it { expect(response.status).to eq 200 }
      it { expect(JSON.parse(response.body)["mission"]["status"]).to eq "in mission" }
    end

    context "with unallowed params" do
      before { patch mission_path(id: @mission.id, mission: { bad_key: "never assigned value" }) }
      it { expect(response.status).to eq 200 }
      it { expect(response.body).to include @mission.to_json }
    end
  end

end