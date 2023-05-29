class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :dates, presence: true
end
