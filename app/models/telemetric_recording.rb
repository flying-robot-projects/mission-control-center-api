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

class TelemetricRecording < ActiveRecord::Base
  belongs_to :mission

  validates :mission_id, :data, presence: true
end
