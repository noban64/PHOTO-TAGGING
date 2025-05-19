# == Schema Information
#
# Table name: scoreboards
#
#  id          :integer          not null, primary key
#  level_id    :integer
#  player_name :string
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class ScoreboardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
