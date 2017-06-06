class Contributor < ApplicationRecord
  belongs_to :user
  belongs_to :kitty
  monetize :price_cents

  validates :price, presence: true, numericality: { greater_than: 0 }

  def self.ordered
    order(created_at: :desc)
  end
end
