# == Schema Information
#
# Table name: ships
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#

class Ship < ActiveRecord::Base
  validates :name, :status, :category, presence: true
  validates :status, inclusion: { in: %w(waiting on_launch_pad flying destroyed landed) }
  validates :category, inclusion: { in: %w(balloon zeppelin plane drone rocket) }
end
