# == Schema Information
#
# Table name: albums
#
#  id               :integer          not null, primary key
#  band_id          :integer          not null
#  title            :string           not null
#  year             :integer          not null
#  studio_recording :boolean          default(TRUE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Album < ApplicationRecord
  validates :year, presence: true
  validates :title, presence: true
  validates :studio_recording, presence: true 

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band

end
