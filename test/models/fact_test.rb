# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string(50)
#  description :string(250)
#  real        :boolean
#  color       :string(255)
#  code        :string(255)
#  resource    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
