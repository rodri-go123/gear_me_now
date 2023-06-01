class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  geocoded_by :address
  validates :name, :description, :price, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

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
