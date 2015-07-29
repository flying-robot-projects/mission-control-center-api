# == Schema Information
#
# Table name: ships
#
#  id            :integer          not null, primary key
#  name          :string
#  ship_model_id :integer
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Ship < ActiveRecord::Base
  belongs_to :ship_model
end