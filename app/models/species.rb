class Species < ApplicationRecord
  has_many :tags
  has_one_attached :photo
end
