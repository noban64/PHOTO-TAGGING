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
  has_many :coordinates, dependent: :destroy;
  has_one_attached :images do |image|
    image.variant :screen, resize_to_limit: [1280,720];
  end
end
