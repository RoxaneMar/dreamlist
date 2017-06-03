class Kitty < ApplicationRecord
  belongs_to :dream
  has_many :contributors

  def total_contribution
    # contributors.sum(:amount)
    contribution = 0
    self.contributors.each do |contributor|
      contribution += contributor.amount
    end
    contribution.to_i
  end

  def total_visible_contribution
    contribution = 0
    self.contributors.each do |contributor|
      if contributor.private
        contribution
      else
        contribution += contributor.amount
      end
    end
    contribution.to_i
  end

  def contribution_avancement
    if goal_amount > 0
      (total_contribution.to_f / goal_amount)*100
    else
      100
    end
  end
end
