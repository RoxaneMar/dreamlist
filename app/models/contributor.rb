class Contributor < ApplicationRecord
  belongs_to :user
  belongs_to :kitty
  monetize :price_cents

  validates :price, presence: true, numericality: { greater_than: 0 }

  after_create :check_kitty_status

  def self.paid
    where(state: 'paid')
  end

  private

  def check_kitty_status
    if kitty.reached?
      Notification.create!(
        user: kitty.dream.user,
        subject: kitty.dream,
        content: "Your dream '#{kitty.dream.title}' reached its goal amount! It's time to fulfill it!"
      )
    end
  end
end
