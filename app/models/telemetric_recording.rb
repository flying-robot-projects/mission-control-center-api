# == Schema Information
#
# Table name: telemetric_recordings
#
#  id         :integer          not null, primary key
#  flight_id  :integer
#  data       :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TelemetricRecording < ActiveRecord::Base
  belongs_to :flight

  validates :flight_id, :data, presence: true
end