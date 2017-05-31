class Dream < ApplicationRecord
  CATEGORIES = %w(travel adventure sport art music cinema culture education mode technology challenges other)
  belongs_to :user
  has_one :kitty
  has_attachment :picture

  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }

  accepts_nested_attributes_for :kitty
end
