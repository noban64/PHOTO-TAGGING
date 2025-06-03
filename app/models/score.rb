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

class Score < ApplicationRecord
end
