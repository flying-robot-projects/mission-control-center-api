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

  pending "Create action"

  pending "Show action"

  pending "Update action"

  pending "Destroy action"

end