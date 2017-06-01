class Contributor < ApplicationRecord
  belongs_to :user
  belongs_to :kitty

  validates :private, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
