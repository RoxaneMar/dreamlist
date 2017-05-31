class Contributor < ApplicationRecord
  belongs_to :user
  belongs_to :kitty

  validates :amount, presence: true
end
