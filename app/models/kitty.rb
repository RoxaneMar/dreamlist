class Kitty < ApplicationRecord
  belongs_to :dream
  has_many :contributors
  monetize :goal_amount_cents

  def total_contribution_public
    contribution = 0
    self.contributors.each do |contributor|
      if contributor.private
        contribution
      else
        contribution += contributor.price
      end
    end
    contribution.to_i
  end

  def total_contribution_private
    contribution = 0
    self.contributors.each do |contributor|
      if !contributor.private
        contribution
      else
        contribution += contributor.amount
      end
    end
    contribution.to_i
  end

  # for green progress bar
  def contribution_avancement_public
    if total_contribution_public >= goal_amount
      100
    elsif goal_amount > 0
      (total_contribution_public.to_f / goal_amount)*100
    else
      100
    end
  end

  def contribution_avancement_private
    if total_contribution_private >= goal_amount
      100
    elsif goal_amount > 0
      (total_contribution_private.to_f / goal_amount)*100
    else
      100
    end
  end

  # for % of money pot reached
  def real_contribution_avancement
    if goal_amount > 0
      (total_contribution_public.to_f / goal_amount)*100
    else
      100
    end
  end

  def real_contribution_avancement_private
    if goal_amount > 0
      (total_contribution_private.to_f / goal_amount)*100
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
