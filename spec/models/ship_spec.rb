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

require "rails_helper"

RSpec.describe Ship, :type => :model do
  subject { build(:ship) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :ship_model_id }
  it { is_expected.to validate_presence_of :status }
end