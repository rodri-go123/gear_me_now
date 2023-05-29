class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :rentals
  validates :name, :description, :price, presence: true

end
