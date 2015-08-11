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

require "rails_helper"

RSpec.describe ShipModel, :type => :model do
  subject { build(:ship_model) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :category }
end