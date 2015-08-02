require "rails_helper"

RSpec.describe "FlightsController", :type => :request do

  describe "Index action" do
    let(:flight) { create(:flight) }
    before { get flights_path }
    it { expect(response.body).to include flight }
    it { expect(response.format).to eq json } # WIP
  end

  pending "Show action"

end