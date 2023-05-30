class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, :description, :price, presence: true
end
