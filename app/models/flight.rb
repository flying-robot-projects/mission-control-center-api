# == Schema Information
#
# Table name: flights
#
#  id                    :integer          not null, primary key
#  ship_id               :integer
#  status                :string
#  telemetric_recordings :json
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Flight < ActiveRecord::Base
  belongs_to :ship
end