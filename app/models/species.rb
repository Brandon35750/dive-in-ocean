class Species < ApplicationRecord
  has_many :tags
  has_one_attached :photo

  validates :latin_name, :description, :size, :color, presence: true
  validates :name, presence: true, uniqueness: true
end
