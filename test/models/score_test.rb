# == Schema Information
#
# Table name: scores
#
#  id           :integer          not null, primary key
#  player_name  :string
#  player_score :interval
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "test_helper"

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
