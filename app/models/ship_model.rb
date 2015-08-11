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
  validates :name, :category, presence: true
  validates :category, inclusion: { in: %w(balloon zeppelin plane drone rocket) }
end