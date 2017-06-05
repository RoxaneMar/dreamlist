class Kitty < ApplicationRecord
  belongs_to :dream
  has_many :contributors
  monetize :goal_amount_cents

  # def total_contribution
  #   # contributors.sum(:amount)
  #   contribution = 0
  #   self.contributors.each do |contributor|
  #     contribution += contributor.amount
  #   end
  #   contribution.to_i
  # end

  def total_contribution
    contribution = 0
    self.contributors.each do |contributor|
      if contributor.private
        contribution
      else
        contribution += contributor.price
      end
    end
    contribution
  end

  def contribution_avancement
    if goal_amount > 0
      (total_contribution / goal_amount.to_i)*100
    else
      100
    end
  end

  # def contribution_avancement_revealed
  #   if goal_amount > 0
  #     (total_contribution.to_f / goal_amount)*100
  #   else
  #     100
  #   end
  # end

  def public_contributors_count
    total_contributors = 0
    self.contributors.each do |contributor|
      total_contributors += 1 if !contributor.private
    end
    total_contributors
  end

  def secret?
    self.contributors.any? { |contributor| contributor.private }
  end
end
