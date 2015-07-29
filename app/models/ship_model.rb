# == Schema Information
#
# Table name: ship_models
#
#  id         :integer          not null, primary key
#  name       :string
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShipModel < ActiveRecord::Base
end