# == Schema Information
#
# Table name: scoreboards
#
#  id          :integer          not null, primary key
#  level_id    :integer
#  player_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  score       :time
#

require "test_helper"

class ScoreboardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
