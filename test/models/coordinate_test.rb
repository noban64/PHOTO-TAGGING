# == Schema Information
#
# Table name: coordinates
#
#  id           :integer          not null, primary key
#  level_id     :integer          not null
#  x_cord       :integer
#  y_cord       :integer
#  character_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_coordinates_on_level_id  (level_id)
#

require "test_helper"

class CoordinateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
