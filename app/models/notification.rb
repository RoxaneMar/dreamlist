class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  def self.ordered
    order(created_at: :desc)
  end
end
