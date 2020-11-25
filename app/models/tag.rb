class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :species
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [],
    associated_against: {
      species: [ :name, :latin_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
