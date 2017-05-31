class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :kitty
  has_attachment :picture
  validates :picture, presence: true

  accepts_nested_attributes_for :kitty
end
