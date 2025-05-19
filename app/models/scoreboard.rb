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

class Scoreboard < ApplicationRecord
end
