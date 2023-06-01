class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, :description, :price, presence: true

  include PgSearch::Model
  pg_search_scope :super_search,
                  against: %i[name description],
                  associated_against: {
                    user: %i[first_name last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
