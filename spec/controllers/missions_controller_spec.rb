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
      let(:valid_params) { @mission.attributes }
      before { post missions_path(mission: valid_params) }
      it { expect(response.status).to eq 201 }
    end

    context "with unknown ship ID" do
      let(:valid_params_with_unknown_ship_id) { @mission.attributes }
      before do
        valid_params_with_unknown_ship_id["ship_id"] = -1
        post missions_path(mission: valid_params_with_unknown_ship_id)
      end
      it { expect(response.status).to eq 422 }
    end

    context "with invalid params" do
      let(:invalid_params) {{ invalid_key: "never assigned value" }}
      before { post missions_path(mission: invalid_params) }
      it { expect(response.status).to eq 422 }
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
    end
  end

  describe "Update action" do

    context "with allowed params" do
      before { patch mission_path(id: @mission.id, mission: { status: "in_progress" }) }
      it { expect(response.status).to eq 200 }
      it { expect(JSON.parse(response.body)["mission"]["status"]).to eq "in_progress" }
    end

    context "with unallowed params" do
      before { patch mission_path(id: @mission.id, mission: { bad_key: "never assigned value" }) }
      it { expect(response.status).to eq 200 }
      it { expect(response.body).to include @mission.to_json }
    end
  end

end