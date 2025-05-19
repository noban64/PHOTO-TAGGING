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

class Level < ApplicationRecord
end
