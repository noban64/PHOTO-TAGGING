# == Schema Information
#
# Table name: levels
#
#  id                :integer          not null, primary key
#  level_id          :integer
#  level_coordinates :integer          is an Array
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require "test_helper"

class LevelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
