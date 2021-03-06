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

class Mission < ActiveRecord::Base
  belongs_to :ship

  validates :ship_id, :status, presence: true
  validates :status, inclusion: { in: %w(pending in_progress ended) }
end
