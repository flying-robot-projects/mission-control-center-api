# == Schema Information
#
# Table name: missions
#
#  id                    :integer          not null, primary key
#  ship_id               :integer
#  status                :string
#  telemetric_recordings :json
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require "rails_helper"

RSpec.describe Mission, :type => :model do
  subject { build(:mission) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :ship_id }
  it { is_expected.to validate_presence_of :status }
end
