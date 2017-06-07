class Dream < ApplicationRecord
  CATEGORIES = %w(travel adventure sport art music cinema culture education mode technology home challenges other)
  belongs_to :user
  has_one :kitty
  has_many :likes
  has_many :contributors, through: :kitty
  has_attachment :picture

  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }

  include PgSearch
  pg_search_scope :global_search, against: [:title, :description, :category],
    associated_against: {
      user: [:first_name, :last_name]
    }

  accepts_nested_attributes_for :kitty

  def self.ordered
    order(created_at: :desc)
  end
end
