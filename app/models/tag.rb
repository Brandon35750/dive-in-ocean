class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :species
  has_one_attached :photo

  scope :geocoded, -> { where.not(latitude: nil, longitude: nil) }

end
