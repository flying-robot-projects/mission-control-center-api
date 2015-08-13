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

require "rails_helper"

RSpec.describe Ship, :type => :model do
  subject { build(:ship) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :status }
  it { is_expected.to validate_presence_of :category }
end
