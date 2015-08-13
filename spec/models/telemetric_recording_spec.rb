# == Schema Information
#
# Table name: telemetric_recordings
#
#  id         :integer          not null, primary key
#  mission_id :integer
#  data       :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe TelemetricRecording, :type => :model do
  subject { build(:telemetric_recording) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :mission_id }
  it { is_expected.to validate_presence_of :data }
end
