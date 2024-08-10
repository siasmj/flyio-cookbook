class Recipe < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [ :title, :ingredients, :instructions ], using: { tsearch: { prefix: true } }

  belongs_to :category, optional: true

  validates :title, :ingredients, :instructions, presence: true
  validates :title, uniqueness: true
end
